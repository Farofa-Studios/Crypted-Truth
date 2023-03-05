//
//  GeniusViewModel.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 14/02/23.
//

import Foundation
import GameController
import Combine

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
    
    @Published var roundHitsCounter: Int
    
    var willChange = PassthroughSubject<GeniusViewModel, Never>()
    var didChange = PassthroughSubject<GeniusViewModel, Never>()
    
    @Published var playerInputDirection: UISwipeGestureRecognizer.Direction? {
        willSet {
            willChange.send(self)
        }
        
        didSet {
            didChange.send(self)
        }
    }
    
    let sax, guitar, piano, tambourine: Instrument
    let instruments: [Instrument]
                
    init() {
        
        sax = Instrument(name: "sax")
        guitar = Instrument(name: "guitar")
        piano = Instrument(name: "piano")
        tambourine = Instrument(name: "tambourine")
        
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
        
        self.roundHitsCounter = 0
        
    }
    
    static func createGeniusGame(instruments: [Instrument]) -> [[Instrument]] {
        
        let rounds = 5
        
        var matchInstruments: [[Instrument]] = []
        var roundInstruments: [Instrument] = []
        
        for _ in 1...rounds {
            roundInstruments.append(instruments.randomElement()!)
            matchInstruments.append(roundInstruments)
        }
        
        return matchInstruments
        
    }
    
    func getInstrumentByInputDirection() -> Instrument? {
        
        switch playerInputDirection {
            case UISwipeGestureRecognizer.Direction.up:
                return sax
            case UISwipeGestureRecognizer.Direction.down:
                return guitar
            case UISwipeGestureRecognizer.Direction.left:
                return piano
            case UISwipeGestureRecognizer.Direction.right:
                return tambourine
            default:
                return nil
        }
        
    }
    
    func playInstrument(_ instrument: Instrument) {
            
        SoundManager.instance.playSoundMPEG(sound: instrument.name, loops: 0)
        updateInstrumentStatus(instrument, status: true)
        instrument.image = getCurrentInstrumentImage(instrument: instrument)
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.updateInstrumentStatus(instrument, status: false)
            instrument.image = self.getCurrentInstrumentImage(instrument: instrument)
        }
        
    }
    
    private func updateInstrumentStatus(_ instrument: Instrument, status: Bool) {
        
        isInstrumentBlinking = status
        
        switch instrument.name {
            case "sax":
                isSaxBlinking = status
            case "guitar":
                isGuitarBlinking = status
            case "piano":
                isPianoBlinking = status
            case "tambourine":
                isTambourineBlinking = status
            default:
                break
        }
        
    }
    
    func restartGame() {
        print("restarting...")
        roundCounter = 1
        isGameOver = false
        playCurrentRound()
    }
    
    func playCurrentRound() {
        
        isPlayerTurn = false
        roundHitsCounter = 0
        
        startCpuTurn(completionHandler: { [self] in
            isPlayerTurn = true
        })
        
    }
    
    func evalPlayerInput() {
        
        if !isPlayerTurn {
            print("not player turn")
            return
        }
        
        let playerInput = getInstrumentByInputDirection()!
        let roundInstruments = matchInstruments[roundCounter - 1]
        
        print("player input: \(playerInput.name)")
        let cpuInput = roundInstruments[roundHitsCounter]

        if playerInput.name == cpuInput.name { // jogador acertou
            isCorrectInput = true
            roundHitsCounter += 1
        } else { // jogador errou
            isCorrectInput = false
            mistakesCounter += 1
        }

        playInstrument(playerInput)
        
        if roundHitsCounter == roundCounter {
            print("round concluded")
            if roundCounter == matchInstruments.count {
                didConcludeGame = true
                return
            }
            roundCounter += 1
            playCurrentRound()
        }

        if !(isCorrectInput!) {
            print("round failed")
            isGameOver = true
        }
        
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
    
    private func getCurrentInstrumentImage(instrument: Instrument) -> String {
        
        if !isInstrumentBlinking {
            return "\(instrument.name)-default"
        }

        if !isPlayerTurn {
            return "\(instrument.name)-white"
        }

        if isCorrectInput! {
            return "\(instrument.name)-blue"
        } else {
            return "\(instrument.name)-red"
        }

    }
    
}
