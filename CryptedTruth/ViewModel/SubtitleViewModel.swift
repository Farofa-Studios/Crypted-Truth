//
//  SubtitleViewModel.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 16/02/23.
//

import Foundation

final class SubtitleViewModel: ObservableObject {
    
    var selectedSubtitle: Subtitle? {
        didSet {
            self.isPresentingSubtitleView = true
        }
    }
    
    @Published var isPresentingSubtitleView = false
    
}
