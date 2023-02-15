//
//  CharacterBoard.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 15/02/23.
//

import Foundation

/**
 General information about a victim.
 */

struct Victim: Identifiable {
    
    /// Unique identifier.
    let id: String
    /// Name
    let name: String
    /// Victim picture
    let picture: String
    
    init(id: String, name: String, picture: String) {
        self.id = id
        self.name = name
        self.picture = picture
    }
    
}
