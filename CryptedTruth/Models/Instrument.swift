//
//  Instrument.swift
//  CryptedTruth
//ra
//  Created by Alex A. Rocha on 24/02/23.
//

import Foundation
import SwiftUI

class Instrument: ObservableObject {
    var name: String
    @Published var image: String
    
    init(name: String) {
        self.name = name
        self.image = "\(name)-default"
    }
    
}
