//
//  SoundManager.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 28/09/22.
//

import Foundation
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(_ sound: String) {
        
        guard let url = Bundle.main.url(forResource: sound, withExtension: ".mpeg") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }

    }
}
