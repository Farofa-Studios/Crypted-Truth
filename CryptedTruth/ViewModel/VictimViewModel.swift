//
//  VictimViewModel.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 15/02/23.
//

import Foundation

final class VictimViewModel: ObservableObject {
    
    var selectedVictim: Victim? {
        didSet {
            self.isPresentingVictimView = true
        }
    }
    
    @Published var isPresentingVictimView = false
    
}
