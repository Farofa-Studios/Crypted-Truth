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
    let image: String?
    /// Type of speaker
    let type: Avatars?
    /// Subtitle
    let subtitle: String
    
    let audio: String
    
    init(id: Int, image: String?, type: Avatars?, subtitle: String, audio: String) {
        self.id = id
        self.image = image
        self.type = type
        self.subtitle = subtitle
        self.audio = audio
    }
    
    init() {
        self.id = 0
        self.image = ""
        self.type = nil
        self.subtitle = ""
        self.audio = ""
    }
}
