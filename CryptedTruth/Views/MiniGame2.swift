//
//  MiniGame2.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 14/02/23.
//

import SwiftUI

struct MiniGame2: View {
    
    let ingredientsOptionList = ["globe.americas.fill", "sun.min.fill", "sunset.circle.fill", "sun.dust.circle.fill", "moon.fill", "moon.haze.fill", "moon.stars.fill", "cloud.fill"].shuffled()
    
    @State var scale = 1.0
    
    @State var ingredient = "questionmark.square.fill"
    
    let recipe = Recipes.allRecipes[0]
    
    let numOfRecipes = Recipes.allRecipes.count
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                VStack {
                    Text("Rodada")
                        .font(.system(size: 38))
                    
                    HStack (spacing: 0){
                        Text("\(recipe.id)")
                            .font(.system(size: 57))
                            .foregroundColor(.white)
                        
                        Text("/\(numOfRecipes)")
                            .font(.system(size: 48))
                            .foregroundColor(.white)
                            .opacity(0.6)
                    }
                }
                
                VStack (alignment: .center){
                    
                    Text("Ingredientes")
                        .font(.system(size: 38))
                    
                    HStack {
                        ForEach(recipe.ingredientsList.sorted(by: >), id: \.key) { key, value in
                            VStack {
                                
                                Image(systemName: key)
                                
                                
                                Text(value)
                                    .font(.system(size: 25))
                            }
                        }
                    }
                }
                
                VStack {
                    Text(recipe.title)
                        .font(.system(size: 38))
                    Image(systemName: recipe.image)
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(ingredientsOptionList, id: \.self) { item in
                    
                    IngredientsButton(image: item, answer: recipe.correctAnswer){
                        self.buttonTapped(item)
                    }
                }
            }
            
            Spacer()
            
            SubtitleView()
        }
    }
    
    
    private func buttonTapped(_ selected: String) {
        if selected == recipe.correctAnswer {
            ingredient = selected
            
            // aumenta escala
            withAnimation(.easeIn(duration: 0.3)){
                self.scale += 1.0
            }
            
            // retorna escala original
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
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
    
    var body: some View {
        Button(action: {
            if self.image != self.answer {
                
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
            
        }) {
            Image(systemName: image)
        }
        
        .rotationEffect(.degrees(image != answer ? angle: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2()
    }
}
