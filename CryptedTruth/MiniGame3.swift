//
//  MiniGame3.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import SwiftUI

func randomPosition() -> Double {
    let number = Int.random(in: 1...4)
    let doubleNumber: Double =  Double(number)
    return doubleNumber
}

class Images: ObservableObject {
    @Published var listOfPieces = [
        MiniGame3Images(image: "01", rotation: randomPosition()),
        MiniGame3Images(image: "02", rotation: randomPosition()),
        MiniGame3Images(image: "03", rotation: randomPosition()),
        MiniGame3Images(image: "04", rotation: randomPosition()),
        MiniGame3Images(image: "05", rotation: randomPosition()),
        MiniGame3Images(image: "06", rotation: randomPosition()),
        MiniGame3Images(image: "07", rotation: randomPosition()),
        MiniGame3Images(image: "08", rotation: randomPosition()),
        MiniGame3Images(image: "09", rotation: randomPosition()),
        MiniGame3Images(image: "10", rotation: randomPosition()),
        MiniGame3Images(image: "11", rotation: randomPosition()),
        MiniGame3Images(image: "12", rotation: randomPosition()),
        MiniGame3Images(image: "13", rotation: randomPosition()),
        MiniGame3Images(image: "14", rotation: randomPosition()),
        MiniGame3Images(image: "15", rotation: randomPosition()),
        MiniGame3Images(image: "16", rotation: randomPosition())
    ]
}

struct MiniGame3: View {
    
    @StateObject var pieces = Images()
    
    let rows = Array(repeating: GridItem(.flexible(), spacing: -1000), count: 4)
    
    var body: some View {
        
        VStack {
            
            LazyVGrid(columns: rows, spacing: 25) {
                
                ForEach($pieces.listOfPieces, id: \.image) { $piece in
                    CardButton(image: piece.image, rotation: Int(piece.rotation))
                }
            }
            
            SubtitleView()
            
//            VStack(spacing: 50) {
//                Text("Clique na imagem para rotacionar e descubra a pista escondida")
//                    .font(.title3)
//                    .foregroundColor(.blue)
//                Button("Confirm") {
//                    print("button confirm pressed")
//                }
//                .buttonStyle(.borderedProminent)
//                .foregroundColor(.green)
//            }
        }
    }
}

struct CardButton: View {
    let image: String
    @State var rotation: Int
    
    var body: some View {
        
        Button(action: {
            rotation = rotation % 4 + 1
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

struct MiniGame3_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame3()
    }
}
