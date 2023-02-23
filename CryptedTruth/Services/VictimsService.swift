//
//  VictimsService.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 15/02/23.
//

import Foundation
import SwiftUI

class Victims: ObservableObject {
    
    @Published var allVictims: [Victim] = [
        .init(id: "1", name: "Saulo", firstPicture: "Quadro-Default-Vítima-1", card: "Cartão-Vítima-4", minigame: AnyView(MiniGame2()), picture: "Quadro-Reveal-Vítima-1", letters: ["S", "O"], finalPicture: "Quadro-Final-Vítima-1", tapped: false),
        .init(id: "2", name: "Ming", firstPicture: "Quadro-Default-Vítima-2", card: "Cartão-Vítima-3", minigame: AnyView(AnagramView()), picture: "Quadro-Reveal-Vítima-2", letters: ["I", "N"], finalPicture: "Quadro-Final-Vítima-2", tapped: false),
        .init(id: "3", name: "Sandra", firstPicture: "Quadro-Default-Vítima-3", card: "Cartão-Vítima-2", minigame: AnyView(MiniGame2()), picture: "Quadro-Reveal-Vítima-3", letters: ["S", "D"], finalPicture: "Quadro-Final-Vítima-3", tapped: false),
        .init(id: "4", name: "Vincent", firstPicture: "Quadro-Default-Vítima-4", card: "Cartão-Vítima-1", minigame: AnyView(AnagramView()), picture: "Quadro-Reveal-Vítima-4", letters: ["E", "T"], finalPicture: "Quadro-Final-Vítima-4", tapped: false),
    ]
    
}
