//
//  MiniGame3CardButtonView.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/16/23.
//

import SwiftUI

struct CardButton: View {
    let image: String
    @State var rotation: Int
    
    var body: some View {
        
        Button(action: {
            rotation = rotation % 4 + 1
            
            SoundManager.instance.playSoundMPEG(sound: "") // peça rodadando
            if rotation == 1 {
                // varrer vetor e confirmar posição 1 em rotation
                SoundManager.instance.playSoundMP3(sound: "") // vencer jogo
            }
            print(rotation)
            
        }) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 160)
        }
        .buttonStyle(.card)
        .rotationEffect(.degrees(90 * Double(rotation)))
    }
}
