//
//  MiniGame3ButtonInfos.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import Foundation

class MiniGame3Images: ObservableObject {
    var image: String
    @Published var rotation: Int
    
    init(image: String, rotation: Int) {
        self.image = image
        self.rotation = rotation
    }
}

class ImagesProperties: ObservableObject {
    
    var checkGame: Int = 1
    
    @Published var listOfPieces = [
        MiniGame3Images(image: "01", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "02", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "03", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "04", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "05", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "06", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "07", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "08", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "09", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "10", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "11", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "12", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "13", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "14", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "15", rotation: Int.random(in: 1...4)),
        MiniGame3Images(image: "16", rotation: Int.random(in: 1...4))
    ]
    
    func checkPiecesRotation() -> Int {
        for position in 0...listOfPieces.count - 1 {
            
            if listOfPieces[position].rotation != 0 {
                
                print("quadro \(position + 1) errado, rotacao \(listOfPieces[position].rotation)")
                
                checkGame = 0
            }
        }
        return checkGame
    }
}
