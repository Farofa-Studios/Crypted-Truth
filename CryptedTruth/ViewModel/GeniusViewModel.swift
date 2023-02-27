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
    @Published var isGameOver: Bool
    @Published var didConcludeGame: Bool
    
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
        self.isCorrectInput = nil
        self.didConcludeGame = false
        self.isGameOver = false
        
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
        instrument.image = getCurrentInstrumentImage(instrument: instrument)
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.updateInstrumentStatus(instrument, status: false)
            instrument.image = self.getCurrentInstrumentImage(instrument: instrument)
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
    
    func restartGame() {
        roundCounter = 1
        isGameOver = false
        playAllRounds()
    }
    
    func playCurrentRound(completionHandler: @escaping () -> ()) {
        
        startCpuTurn(completionHandler: { [self] in
            startPlayerTurn(completionHandler: { [self] didPlayerFinishRound in
                if !didPlayerFinishRound {
                    isGameOver = true
                } else {
                    completionHandler()
                }
            })
            
        })
        
    }
    
    func playAllRounds() {
        
        print("round: \(roundCounter)/\(matchInstruments.count)")
                    
        playCurrentRound(completionHandler: { [self] in
            if roundCounter < matchInstruments.count {
                roundCounter += 1
                playAllRounds()
            } else {
                didConcludeGame = true
                print("genius finished")
            }
        })
        
    }
    
    func startCpuTurn(completionHandler: @escaping () -> ()) {
        
        isPlayerTurn = false
        
        let roundInstruments = matchInstruments[roundCounter - 1]
        var cpuInputCounter = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.25, repeats: true) { timer in
                        
            if cpuInputCounter == roundInstruments.count {
                timer.invalidate()
                completionHandler()
                return
            }
            
            let currentInstrument = roundInstruments[cpuInputCounter]
            print("cpu input: \(currentInstrument.name)")
            self.playInstrument(currentInstrument)
            
            cpuInputCounter += 1
            
        }
        
    }
    
    func startPlayerTurn(completionHandler: @escaping (Bool) -> ()) {
        
        isPlayerTurn = true
        
        var playerInputCounter = 0
        var didPlayerFinishRound = false
        
        GeniusMockedSwipes.getMockedSwipes(roundInstruments: matchInstruments[roundCounter - 1],
                                           isSuccesfulRound: false,
                                           swipeHandler: { [self] playerInput, timer in
            
            playerInputCounter += 1
            print("player input: \(playerInput.name),", terminator: " ")
            
            let cpuInputDirection = matchInstruments[roundCounter - 1][playerInputCounter - 1].direction
            
            if playerInput.direction == cpuInputDirection {
                print("correct input")
                isCorrectInput = true
            } else {
                print("incorrect input")
                isCorrectInput = false
                mistakesCounter += 1
            }
            
            playInstrument(playerInput)
            
            if playerInputCounter == roundCounter {
                print("round finished, \(playerInputCounter) correct inputs\n")
                didPlayerFinishRound = true
                timer.invalidate() // apagar depois
                completionHandler(didPlayerFinishRound)
                return
            }
            
            if !(isCorrectInput!) {
                print("round finished, \(playerInputCounter) correct inputs\n")
                didPlayerFinishRound = false
                timer.invalidate() // apagar depois
                completionHandler(didPlayerFinishRound)
                return
            }
                        
        })
        
    }
    
    private func getCurrentInstrumentImage(instrument: Instrument) -> String {
        
        if !isInstrumentBlinking {
            return "\(instrument.direction)-default"
        }

        if !isPlayerTurn {
            return "\(instrument.direction)-white"
        }

        if isCorrectInput! {
            return "\(instrument.direction)-blue"
        } else {
            return "\(instrument.direction)-red"
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
                    let direction = GeniusViewModel.calcSwipeDirection(x, y)
                    directionHandler(direction)
                }
                
            }
            
        }
        
    }
    
}
