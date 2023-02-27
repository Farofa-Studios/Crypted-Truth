//
//  ArrowButtonStyle.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 26/02/23.
//

import Foundation
import SwiftUI

struct BlankButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
    
}
