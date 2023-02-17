//
//  MiniGame3.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import SwiftUI

struct MiniGame3: View {
    
    @StateObject var pieces = ImagesProperties()
    
    let rows = Array(repeating: GridItem(.flexible(), spacing: -1000), count: 4)
    
    var body: some View {
        
        VStack {
            
            LazyVGrid(columns: rows, spacing: 25) {
                
                ForEach($pieces.listOfPieces, id: \.image) { $piece in
                    CardButton(image: piece.image, rotation: Int(piece.rotation))
                }
            }
            SubtitleView()
        }
    }
}

struct MiniGame3_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame3()
    }
}
