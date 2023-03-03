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
    let id: Int
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
    let viewFinal: AnyView?
    
    init(id: Int, name: String, firstPicture: String, card: String, minigame: AnyView, picture: String, letters: [String], finalPicture: String, tapped: Bool, viewFinal: AnyView?) {
        self.id = id
        self.name = name
        self.firstPicture = firstPicture
        self.card = card
        self.minigame = minigame
        self.picture = picture
        self.letters = letters
        self.finalPicture = finalPicture
        self.tapped = tapped
        self.viewFinal = viewFinal
    }
    
}

extension Victim {
    
    static func allVictims() -> [Victim] {
        return [
            .init(id: 0, name: "Vincent", firstPicture: "Quadro-Default-Vítima-1", card: "Cartão-Vítima-1", minigame: AnyView(SmellMiniGame()), picture: "Quadro-Reveal-Vítima-1", letters: ["E", "T"], finalPicture: "Quadro-Final-Vítima-1", tapped: false, viewFinal: nil),
            
            .init(id: 1, name: "Sandra", firstPicture: "Quadro-Default-Vítima-2", card: "Cartão-Vítima-2", minigame: AnyView(TasteMiniGame()), picture: "Quadro-Reveal-Vítima-2", letters: ["S", "D"], finalPicture: "Quadro-Final-Vítima-2", tapped: false, viewFinal: nil),
            
            .init(id: 2, name: "Ming", firstPicture: "Quadro-Default-Vítima-3", card: "Cartão-Vítima-3", minigame: AnyView(MiniGame3()), picture: "Quadro-Reveal-Vítima-3", letters: ["I", "N"], finalPicture: "Quadro-Final-Vítima-3", tapped: false, viewFinal: nil),
            
            .init(id: 3, name: "Saulo", firstPicture: "Quadro-Default-Vítima-4", card: "Cartão-Vítima-4", minigame: AnyView(GeniusView()), picture: "Quadro-Reveal-Vítima-4", letters: ["S", "O"], finalPicture: "Quadro-Final-Vítima-4", tapped: false, viewFinal: AnyView(FinalView())),
        ]
    }
}

