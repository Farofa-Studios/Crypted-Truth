//
//  MiniGame3.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import SwiftUI

class Images: ObservableObject {
    @Published var listOfPieces = [
        MiniGame3Images(image: "01", rotation: 3),
        MiniGame3Images(image: "02", rotation: 1),
        MiniGame3Images(image: "03", rotation: 2),
        MiniGame3Images(image: "04", rotation: 3),
        MiniGame3Images(image: "05", rotation: 4),
        MiniGame3Images(image: "06", rotation: 1),
        MiniGame3Images(image: "07", rotation: 2),
        MiniGame3Images(image: "08", rotation: 3),
        MiniGame3Images(image: "09", rotation: 2),
        MiniGame3Images(image: "10", rotation: 1),
        MiniGame3Images(image: "11", rotation: 2),
        MiniGame3Images(image: "12", rotation: 3),
        MiniGame3Images(image: "13", rotation: 2),
        MiniGame3Images(image: "14", rotation: 1),
        MiniGame3Images(image: "15", rotation: 2),
        MiniGame3Images(image: "16", rotation: 3)
    ]
}

struct MiniGame3: View {
    
    @StateObject var pieces = Images()
    
    let rows = Array(repeating: GridItem(.flexible(), spacing: -20), count: 4)
    
    var body: some View {
        
        HStack {
            
            LazyVGrid(columns: rows, spacing: 25) {
                
                ForEach($pieces.listOfPieces, id: \.image) { $piece in
                    CardButton(image: piece.image, rotation: piece.rotation)
                }
            }
            VStack(spacing: 50) {
                Text("Clique na imagem para rotacionar e descubra a pista escondida")
                    .font(.title3)
                    .foregroundColor(.blue)
                Button("Confirm") {
                    print("button confirm pressed")
                }
                .buttonStyle(.borderedProminent)
                .foregroundColor(.green)
            }
        }
    }
}

struct CardButton: View {
    let image: String
    @State var rotation: Double
    
    var body: some View {
        
        Button(action: {
            rotation += 1
        }) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 180)
        }
        .buttonStyle(.card)
        .rotationEffect(.degrees(90 * rotation))
    }
}

//struct MiniGame3_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniGame3()
//    }
//}
