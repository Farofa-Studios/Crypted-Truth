//
//  TasteMiniGame.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 23/02/23.
//

import Foundation
import SwiftUI

struct TasteMiniGame: View {
    
    let ingredientsOptionList = ["Op-Ovos", "Op-Bacon", "Op-Queijo", "Op-Tomate", "Op-Trigo"].shuffled()
    
    let numOfItems = Recipes.allRecipes.count
    
    @AppStorage("minigame2") var OK2 = false
    
    @State var currentTasteFase: Int = 0
    @State var isTasteGameFinished: Bool = false
    
    var body: some View {
        
        let recipe = Recipes.allRecipes[currentTasteFase]
        NavigationView() {
            ZStack {
                TasteSmellStructure(
                    ingredientsOptionList: ingredientsOptionList,
                    recipe: recipe,
                    numOfRecipes: numOfItems,
                    title: "Ingredientes",
                    idSubtitles: 2,
                    currentFase: $currentTasteFase,
                    isGameFinished: $isTasteGameFinished
                )
            }
            .onChange(of: isTasteGameFinished) { newValue in
                if newValue {
                    OK2 = true
                }
            }
            .navigationDestination(isPresented: $isTasteGameFinished) {
                ChallengeConcludedView(subtitle: MiniGameSubtitles.allMiniGameSubtitles[2].completed)
            }
        }
    }
    
}


struct TasteMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        TasteMiniGame()
    }
}
