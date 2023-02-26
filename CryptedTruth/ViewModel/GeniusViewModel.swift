//
//  GeniusViewModel.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 14/02/23.
//

import Foundation
import GameController

class GeniusViewModel: ObservableObject {
 
    @Published var matchInstruments: [[Instrument]]
    @Published var roundCounter: Int
    @Published var mistakesCounter: Int
    @Published var isPlayerTurn: Bool
    @Published var isCorrectInput: Bool?
    
    @Published var isInstrumentBlinking: Bool
    @Published var isGuitarBlinking: Bool
    @Published var isPianoBlinking: Bool
    @Published var isSaxBlinking: Bool
    @Published var isTambourineBlinking: Bool
    
    let sax, guitar, piano, tambourine: Instrument
    let instruments: [Instrument]
            
    init() {
        
        sax = Instrument(name: "sax", direction: .up)
        guitar = Instrument(name: "guitar", direction: .down)
        piano = Instrument(name: "piano", direction: .left)
        tambourine = Instrument(name: "tambourine", direction: .right)
        
        instruments = [sax, guitar, piano, tambourine]
        
        self.matchInstruments = GeniusViewModel.createGeniusGame(instruments: instruments)
        self.roundCounter = 1
        self.mistakesCounter = 0
        self.isPlayerTurn = false
        
        self.isInstrumentBlinking = false
        self.isGuitarBlinking = false
        self.isPianoBlinking = false
        self.isSaxBlinking = false
        self.isTambourineBlinking = false
        
    }
    
    static func createGeniusGame(instruments: [Instrument]) -> [[Instrument]] {
        
        let rounds = 9
        
        var matchInstruments: [[Instrument]] = []
        var roundInstruments: [Instrument] = []
        
        for _ in 1...rounds {
            roundInstruments.append(instruments.randomElement()!)
            matchInstruments.append(roundInstruments)
        }
        
        return matchInstruments
        
    }
    
    func playInstrument(_ instrument: Instrument) {
            
        SoundManager.instance.playSound(instrument.name)
        updateInstrumentStatus(instrument, status: true)
        instrument.image = getInstrumentImage(instrument: instrument)
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.updateInstrumentStatus(instrument, status: false)
            instrument.image = self.getInstrumentImage(instrument: instrument)
        }
        
    }
    
    func playInstrumentsByRoundNumber(roundNumber: Int) {
        
        let roundDirections = matchInstruments[roundNumber - 1]
        var counter = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.25, repeats: true) { timer in
                        
            if counter == roundDirections.count {
                timer.invalidate()
                return
            }
            
            let currentInstrument = roundDirections[counter]
            print("\(counter + 1) - playing: \(currentInstrument.name)")
            self.playInstrument(currentInstrument)
            
            counter += 1
            
        }
        
    }
    
    private func updateInstrumentStatus(_ instrument: Instrument, status: Bool) {
        
        isInstrumentBlinking = status
        
        switch instrument.direction {
            case .up:
                isSaxBlinking = status
            case .down:
                isGuitarBlinking = status
            case .left:
                isPianoBlinking = status
            case .right:
                isTambourineBlinking = status
            case .invalid:
                print("invalid direction")
        }
        
    }
    
    private func getInstrumentImage(instrument: Instrument) -> String {
        
        if !isInstrumentBlinking {
            return "\(instrument.direction.rawValue)-default"
        }

        if !isPlayerTurn {
            return "\(instrument.direction.rawValue)-yellow"
        }

        if isCorrectInput! {
            return "\(instrument.direction.rawValue)-blue"
        } else {
            return "\(instrument.direction.rawValue)-red"
        }

    }
    
    static func calcSwipeDirection(_ x: Float, _ y: Float) -> Direction {
        
        let fingerDistanceFromSiriRemoteCenter: Float = 0.7
        
        if y > fingerDistanceFromSiriRemoteCenter {
            return .up
        }
        
        if y < -fingerDistanceFromSiriRemoteCenter {
            return .down
        }
        
        if x < -fingerDistanceFromSiriRemoteCenter {
            return .left
        }
        
        if x > fingerDistanceFromSiriRemoteCenter {
            return .right
        }
        
        return .invalid
                
    }
    
    static func getDirections(directionHandler: @escaping (Direction) -> ()) {
        
        NotificationCenter.default.addObserver(forName: .GCControllerDidConnect, object: nil, queue: .main) { notification in
            
            if let gcController = notification.object as? GCController {
                
                let microGamepad = gcController.microGamepad
                microGamepad!.reportsAbsoluteDpadValues = true
                microGamepad!.dpad.valueChangedHandler = { pad, x, y in
                    directionHandler(GeniusViewModel.calcSwipeDirection(x, y))
                }
                
            }
            
        }
        
    }
    
}
