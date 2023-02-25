//
//  MiniGame2.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 14/02/23.
//

import SwiftUI

struct TasteSmellStructure: View {
    
    let ingredientsOptionList: [String]
    
    @State var scale = 1.0
    
    @State var ingredient = "Ing-faltando"
    
    let recipe: Recipe
    
    let numOfRecipes: Int
    
    let title: String
    
    var body: some View {
        
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                HStack (alignment: .top, spacing: 110) {
                    VStack (spacing: 8){
                        Text("Rodada")
                            .font(.custom("PTMono-Regular", size: 38))
                        
                        HStack (spacing: 0){
                            Text("\(recipe.id)")
                                .font(.custom("PTMono-Regular", size: 57))
                                .foregroundColor(.white)
                            
                            Text("/\(numOfRecipes)")
                                .font(.custom("PTMono-Regular", size: 48))
                                .foregroundColor(.white)
                                .opacity(0.6)
                        }
                    }
                    
                    VStack (alignment: .center){
                        
                        Text(title)
                            .font(.custom("PTMono-Regular", size: 38))
                            .padding(.bottom, 40)
                        
                        HStack (alignment: .top, spacing: 40) {
                            ForEach(recipe.ingredientsList, id: \.self) { item in
                                VStack {
                                    Image(item)
                                        .resizable()
                                        .frame(width: 174, height: 200)
                                }
                            }
                            
                            Image(ingredient)
                                .scaleEffect(scale)
                        }
                    }
                    
                    if let image = recipe.image {
                        VStack {
                            Text("Receita")
                                .font(.custom("PTMono-Regular", size: 38))
                            Image(image)
                                .resizable()
                                .frame(width: 162, height: 162)
                            Text(recipe.title)
                                .font(.custom("PTMono-Regular", size: 29))
                        }
                    }
                }
                
                Spacer()
                
                HStack (alignment: .top, spacing: 32) {
                    ForEach(ingredientsOptionList, id: \.self) { item in
                        
                        IngredientsButton(image: item, answer: recipe.correctAnswer){
                            self.buttonTapped(item)
                        }
                        .padding(-25)
                    }
                }
                
                Spacer()
                
                //                SubtitleView()
            }
        }
    }
    
    
    private func buttonTapped(_ selected: String) {
        
        if selected.contains(recipe.correctAnswer) {
            ingredient = recipe.correctAnswerImage
            
            // aumenta escala
            withAnimation(.easeIn(duration: 0.5)){
                self.scale += 0.2
            }
            
            // retorna escala original
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                withAnimation(.easeIn(duration: 0.3)){
                    self.scale = 1.0
                }
            }
        }
    }
}

struct IngredientsButton: View {
    let image: String
    let answer: String
    var showAnimation = false
    let action: () -> ()
    
    @State private var angle = 0.0
    @State private var isWrong = false
    @State var selected = false
    
    var body: some View {
        Button(action: {
            
            if !self.image.contains(self.answer){
                
                isWrong = true
                
                // vira para a esquerda
                withAnimation(.easeIn(duration: 0.1)){
                    self.angle -= 5.0
                }
                
                // vira para a direita
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    withAnimation(.easeIn(duration: 0.1)){
                        self.angle += 10.0
                    }
                }
                
                // retorna ao grau 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                    withAnimation(.easeIn(duration: 0.1)){
                        self.angle -= 5.0
                    }
                }
            }
            action()
            self.selected.toggle()
        }) {
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 270, height: 270, alignment: .center)
                Spacer()
                Spacer()
            }
            .frame(width: 236, height: 236, alignment: .center)
            
            
        }
        //        .background(self.selected ? Color.white.opacity(20.0) : Color.white.opacity(20.0))
        .background(Color.buttonMinigame)
        .clipShape(Pentagon())
        
        .rotationEffect(.degrees(image != answer ? angle: 0))
    }
}

struct TasteSmellStructure_Previews: PreviewProvider {
    static var previews: some View {
        TasteSmellStructure(
            ingredientsOptionList: ["Op-Ovos", "Op-Bacon", "Op-Queijo", "Op-Tomate", "Op-Trigo"],
            recipe: Recipes.allRecipes[3],
            numOfRecipes: Recipes.allRecipes.count,
            title: "Ingredientes")
    }
}

//struct ContentView: View {
//    @FocusState private var isButtonFocused: Bool
//
//    var body: some View {
//        Button("Botão") {}
//            .tint(.blue)
//            .focusedSceneValue(isButtonFocused ? Color.red : Color.blue)
//            .focusable(true)
//            .focused($isButtonFocused) {
//                print("Botão está em foco: \(isButtonFocused)")
//            }
//            .onReceive(NotificationCenter.default.publisher(for: UIFocusSystem.didUpdateNotification)) { _ in
//                isButtonFocused = UIScreen.main.focusedItem === self
//            }
//    }
//}
