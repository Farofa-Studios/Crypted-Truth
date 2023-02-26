//
//  GeniusMockedSwipes.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 25/02/23.
//

import Foundation

struct GeniusMockedSwipes {
        
    static func getMockedSwipes(roundInstruments: [Instrument], isSuccesfulRound: Bool, swipeHandler: @escaping (Instrument, Timer) -> ()) {
        
        var roundInstrumentsAux = roundInstruments
        
        if !isSuccesfulRound {
            roundInstrumentsAux.shuffle()
        }
                
        var counter = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.25, repeats: true) { timer in

            if counter == roundInstruments.count {
                timer.invalidate()
                return
            }

            swipeHandler(roundInstrumentsAux[counter], timer)
            counter += 1
            
        }
        
    }
    
}
