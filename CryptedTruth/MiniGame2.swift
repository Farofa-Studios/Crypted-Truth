//
//  ContentView.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 13/02/23.
//

import SwiftUI

struct MiniGame2: View {
    
    @State var ingredient = "questionmark.square.fill"
    
    let ingredientsOptionList = ["globe.americas.fill", "sun.min.fill", "sunset.circle.fill", "sun.dust.circle.fill", "moon.fill", "moon.haze.fill", "moon.stars.fill", "cloud.fill"]
    
    let recipeIngredientsList = ["cup.and.saucer.fill", "wineglass.fill", "carrot.fill"]
    
    let recipe = "birthday.cake.fill"
    
    let level = "Fase 1"
    
    let correctAnswer = "moon.haze.fill"
    
    @State var selected = ""
    
    @State var scale = 1.0
    
    var body: some View {
        VStack {
            
            Text(level)
//                .animation(.easeInOut.repeatCount(5), value: scaleValue)
            
            HStack {
                VStack{
                    Text("Receita")
                    Image(systemName: recipe)
                        .padding()
                }
                
                VStack{
                    Text("Ingredientes")
                    
                    HStack {
                        ForEach(recipeIngredientsList, id: \.self) { item in
                            Image(systemName: item)
                        }
                        
                        Image(systemName: ingredient)
                            .scaleEffect(scale)
                        
                    }
                    .padding()
                }
                .padding()
            }
            .padding()
            
            Text("Qual é o ingrediente que falta?")
            
            HStack {
                ForEach(ingredientsOptionList, id: \.self) { item in
                    
                    IngredientsButton(image: item, answer: correctAnswer){
                        self.buttonTapped(item)
                    }
                }
            }
            .padding()
            
        }
        .padding()
    }
    
    private func buttonTapped(_ selected: String) {
        if selected == correctAnswer {
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
//        .foregroundColor(isWrong ? .red: .black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2()
    }
}
