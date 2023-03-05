//
//  GeniusViewControllerRepresentable.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 05/03/23.
//

import Foundation
import SwiftUI

struct GeniusViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = GeniusViewController
    
    func makeUIViewController(context: Context) -> GeniusViewController {
        return GeniusViewController()
    }
    
    func updateUIViewController(_ uiViewController: GeniusViewController, context: Context) {
    }
    
}
