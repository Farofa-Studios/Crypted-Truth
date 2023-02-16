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
