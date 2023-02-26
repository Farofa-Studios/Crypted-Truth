//
//  Instrument.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 24/02/23.
//

import Foundation
import SwiftUI

class Instrument: ObservableObject {
    var name: String
    var direction: Direction
    @Published var image: String
//    
    init(name: String, direction: Direction) {
        self.name = name
        self.direction = direction
        self.image = "\(direction.rawValue)-default"
    }
    
}
