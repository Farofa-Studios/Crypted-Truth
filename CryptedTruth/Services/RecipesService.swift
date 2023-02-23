//
//  RecipesService.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 16/02/23.
//

import Foundation

struct Recipes {
    
    static let allRecipes: [Recipe] = [
        .init(id: 1,
              image: "Receita-Macarronada",
              title: "Macarronada",
              ingredientsList: ["Ing-Queijo", "Ing-Massa", "Ing-Oregano", "Ing-Carne"],
              correctAnswer: "Tomate"),
        
            .init(id: 2,
                  image: "Receita-Ravioli",
                  title: "Ravioli",
                  ingredientsList: ["Ing-Trigo", "Ing-Presunto", "Ing-Oregano", "Ing-Tomate"],
                  correctAnswer: "Ovos"),
        
            .init(id: 3,
                  image: "Receita-Lasanha",
                  title: "Lasanha",
                  ingredientsList: ["Ing-Massa", "Ing-Carne", "Ing-Tomate", "Ing-Oregano"],
                  correctAnswer: "Queijo"),
        
            .init(id: 4,
                  image: "Receita-Carbonara",
                  title: "Carbonara",
                  ingredientsList: ["Ing-Massa", "Ing-Queijo", "Ing-Pimenta", "Ing-Ovos"],
                  correctAnswer: "Bacon"),
    ]
    
}
