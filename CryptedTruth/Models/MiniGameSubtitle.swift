//
//  SubtitleMiniGame.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 24/02/23.
//

import Foundation

/**
 General information about a minigame subtitle .
 */

struct MiniGameSubtitle {
    
    /// Instructions subtitle
    let instructions: Subtitle
    /// Hit subtitle
    let hit: Subtitle?
    /// Last hit subtitle
    let lastHit: Subtitle?
    /// Error subtitle
    let error: Subtitle?
    /// Completed with error subtitle
    let completedWithError: Subtitle?
    /// Completed without error subtitle
    let completedWithoutError: Subtitle?
    /// Completed subtitle
    let completed: Subtitle?
    
    init(instructions: Subtitle, hit: Subtitle?, lastHist: Subtitle?, error: Subtitle?, completedWithError: Subtitle?, completedWithoutError: Subtitle?, completed: Subtitle?) {
        self.instructions = instructions
        self.hit = hit
        self.lastHit = lastHist
        self.error = error
        self.completedWithError = completedWithError
        self.completedWithoutError = completedWithoutError
        self.completed = completed
    }
    
    init() {
        self.instructions = Subtitle()
        self.hit = Subtitle()
        self.lastHit = Subtitle()
        self.error = Subtitle()
        self.completedWithError = Subtitle()
        self.completedWithoutError = Subtitle()
        self.completed = Subtitle()
    }
}

