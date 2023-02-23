//
//  CharacterBoard.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 15/02/23.
//

import Foundation
import SwiftUI

/**
 General information about a victim.
 */

struct Victim: Identifiable {
    
    /// Unique identifier.
    let id: String
    /// Name
    let name: String
    /// Picture default
    let firstPicture: String
    // Info about victim
    let card: String
    // Minigame victim
    let minigame: AnyView
    // Victim picture
    let picture: String
    // Letters
    let letters: [String]
    // Victim sense reveal
    let finalPicture: String
    // Victim selected
    var tapped: Bool
    
    init(id: String, name: String, firstPicture: String, card: String, minigame: AnyView, picture: String, letters: [String], finalPicture: String, tapped: Bool) {
        self.id = id
        self.name = name
        self.firstPicture = firstPicture
        self.card = card
        self.minigame = minigame
        self.picture = picture
        self.letters = letters
        self.finalPicture = finalPicture
        self.tapped = tapped
    }
    
}
