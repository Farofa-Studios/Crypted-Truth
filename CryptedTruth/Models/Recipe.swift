//
//  Recipe.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 16/02/23.
//

import Foundation
/**
 General information about a subtitle box.
 */

struct Recipe: Identifiable {
    
    /// Unique identifier.
    let id: Int
    /// Recipe image
    let image: String?
    /// Recipe title
    let title: String
    /// List of ingredients
    let ingredientsList: [String]
    /// Correct answer
    let correctAnswer: String
    /// Correct answer IMAGE
    let correctAnswerImage: String
    
    init(id: Int, image: String?, title: String, ingredientsList: [String], correctAnswer: String, correctAnswerImage: String) {
        self.id = id
        self.image = image
        self.title = title
        self.ingredientsList = ingredientsList
        self.correctAnswer = correctAnswer
        self.correctAnswerImage = correctAnswerImage
    }
    
}
