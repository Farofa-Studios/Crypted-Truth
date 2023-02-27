//
//  BoardButtonStyle.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 27/02/23.
//

import Foundation
import SwiftUI

struct BoardButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
}
