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
    
    let recipe = Recipes.allRecipes[1]
    
    let numOfItems = Recipes.allRecipes.count
    
    @AppStorage("minigame3") var OK3 = false
    
    var body: some View {
    
        TasteSmellStructure(
            ingredientsOptionList: ingredientsOptionList,
            recipe: recipe,
            numOfRecipes: numOfItems,
            title: "Ingredientes"
        ).onAppear() {
            OK3 = true
        }
       
    }
    
}


struct TasteMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        TasteMiniGame()
    }
}
