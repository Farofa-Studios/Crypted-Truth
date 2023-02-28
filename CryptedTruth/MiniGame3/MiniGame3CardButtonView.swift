//
//  MiniGame3CardButtonView.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/16/23.
//

import SwiftUI

struct CardButton: View {
    
    var check = ImagesProperties()
    
    let image: String
    @State var rotation: Int
    
    var body: some View {
        
        Button(action: {
            rotation = (rotation + 1) % 4
            
            if rotation == 0 {
                if check.checkPiecesRotation() == 1 {
                    print("jogo ganho")
                }
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
