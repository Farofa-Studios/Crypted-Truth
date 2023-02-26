//
//  SoundManager.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 28/09/22.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSoundMPEG(sound: String) {
        
        guard let url = Bundle.main.url(forResource: sound, withExtension: ".mpeg") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = 2
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }

    }
    
    func playSoundMP3(sound: String) {
        
        guard let url = Bundle.main.url(forResource: sound, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }

    }

}
