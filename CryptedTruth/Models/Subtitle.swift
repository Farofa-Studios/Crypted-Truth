//
//  Subtitle.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 16/02/23.
//

import Foundation

/**
 General information about a subtitle box.
 */

struct Subtitle: Identifiable {
    
    /// Unique identifier.
    let id: String
    /// Image speaker
    let image: String
    /// Subtitle
    let subtitle: [String]
    
    init(id: String, image: String, subtitle: [String]) {
        self.id = id
        self.image = image
        self.subtitle = subtitle
    }
    
}
