//
//  SmellMiniGame.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 23/02/23.
//

import Foundation
import SwiftUI

struct SmellMiniGame: View {
    
    let ingredientsOptionList = ["Op-Alecrim", "Op-Cereja", "Op-Chocolate", "Op-Limão", "Op-Lírio"].shuffled()
    
    let recipe = Aromas.allAromas[0]
    
    let numOfItems = Aromas.allAromas.count
    
    var body: some View {
    
        TasteSmellStructure(
            ingredientsOptionList: ingredientsOptionList,
            recipe: recipe,
            numOfRecipes: numOfItems,
            title: "Cheiros \(recipe.title)"
        )
       
    }
    
}


struct SmellMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        SmellMiniGame()
    }
}
