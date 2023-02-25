//
//  AromasService.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 23/02/23.
//

import Foundation

struct Aromas {
    
    static let allAromas: [Recipe] = [
        .init(id: 1,
              image: nil,
              title: "cítricos",
              ingredientsList: ["cit-Kiwi", "cit-Tangerina", "cit-Morango", "cit-Laranja"],
              correctAnswer: "Limão",
              correctAnswerImage: "cit-Limão"),
        
            .init(id: 2,
                  image: nil,
                  title: "herbais",
                  ingredientsList: ["her-Alecrim", "her-Hortelã", "her-Babosa", "her-Cidreira"],
                  correctAnswer: "Manjericão",
                  correctAnswerImage: "her-Manjericão"),
        
            .init(id: 3,
                  image: nil,
                  title: "doces",
                  ingredientsList: ["doc-Cereja", "doc-Caramelo", "doc-Pirulito", "doc-Balas"],
                  correctAnswer: "Chocolate",
                  correctAnswerImage: "doc-Chocolate"),
        
            .init(id: 4,
                  image: nil,
                  title: "florais",
                  ingredientsList: ["flo-Tulipa", "flo-Íris", "flo-Jasmim", "flo-Rosa"],
                  correctAnswer: "Lírio",
                  correctAnswerImage: "flo-Lírio"),
    ]
    
}
