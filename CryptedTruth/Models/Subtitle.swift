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
    let id: Int
    /// Image speaker
    let image: String
    /// Type of speaker
    let type: Avatars
    /// Subtitle
    let subtitle: String
    
    init(id: Int, image: String, type: Avatars, subtitle: String) {
        self.id = id
        self.image = image
        self.type = type
        self.subtitle = subtitle
    }
}
