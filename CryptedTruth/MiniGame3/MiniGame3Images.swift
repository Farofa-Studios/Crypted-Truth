//
//  MiniGame3ButtonInfos.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import Foundation

class MiniGame3Images: ObservableObject {
    var image: String
    @Published var rotation: Double
    
    init(image: String, rotation: Double) {
        self.image = image
        self.rotation = rotation
    }
}

class ImagesProperties: ObservableObject {
    @Published var listOfPieces = [
        MiniGame3Images(image: "01", rotation: randomPosition()),
        MiniGame3Images(image: "02", rotation: randomPosition()),
        MiniGame3Images(image: "03", rotation: randomPosition()),
        MiniGame3Images(image: "04", rotation: randomPosition()),
        MiniGame3Images(image: "05", rotation: randomPosition()),
        MiniGame3Images(image: "06", rotation: randomPosition()),
        MiniGame3Images(image: "07", rotation: randomPosition()),
        MiniGame3Images(image: "08", rotation: randomPosition()),
        MiniGame3Images(image: "09", rotation: randomPosition()),
        MiniGame3Images(image: "10", rotation: randomPosition()),
        MiniGame3Images(image: "11", rotation: randomPosition()),
        MiniGame3Images(image: "12", rotation: randomPosition()),
        MiniGame3Images(image: "13", rotation: randomPosition()),
        MiniGame3Images(image: "14", rotation: randomPosition()),
        MiniGame3Images(image: "15", rotation: randomPosition()),
        MiniGame3Images(image: "16", rotation: randomPosition())
    ]
}

func randomPosition() -> Double {
    let number = Int.random(in: 1...4)
    let doubleNumber: Double =  Double(number)
    return doubleNumber
}
