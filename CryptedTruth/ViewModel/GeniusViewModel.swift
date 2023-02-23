//
//  GeniusViewModel.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 14/02/23.
//

import Foundation
import GameController

class GeniusViewModel: ObservableObject {
 
    @Published var matchDirections: [[Direction]] = createGeniusGame()
    @Published var round: Int = 1
    @Published var mistakes: Int = 0
    @Published var currentDirection: Direction = .invalid
    
    static func createGeniusGame() -> [[Direction]] {
        
        let rounds = 9
        let options: [Direction] = [.up, .down, .left, .right]
        
        var matchDirections: [[Direction]] = []
        var roundDirections: [Direction] = []
        
        for _ in 1...rounds {
            roundDirections.append(options.randomElement()!)
            matchDirections.append(roundDirections)
        }
        
        return matchDirections
        
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
