//
//  MiniGame3.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import SwiftUI

class ContentX: ObservableObject {
    @Published var infoX = [
        MiniGame3ButtonInfos(image: "coffee-1", rotation: 0),
        MiniGame3ButtonInfos(image: "coffee-2", rotation: 1),
        MiniGame3ButtonInfos(image: "coffee-3", rotation: 2),
        MiniGame3ButtonInfos(image: "coffee-4", rotation: 3),
        MiniGame3ButtonInfos(image: "coffee-5", rotation: 0),
        MiniGame3ButtonInfos(image: "coffee-6", rotation: 1),
        MiniGame3ButtonInfos(image: "coffee-7", rotation: 2),
        MiniGame3ButtonInfos(image: "coffee-8", rotation: 3),
        MiniGame3ButtonInfos(image: "coffee-9", rotation: 0),
        MiniGame3ButtonInfos(image: "coffee-10", rotation: 1),
        MiniGame3ButtonInfos(image: "coffee-11", rotation: 2),
        MiniGame3ButtonInfos(image: "coffee-12", rotation: 3),
        MiniGame3ButtonInfos(image: "coffee-13", rotation: 0),
        MiniGame3ButtonInfos(image: "coffee-14", rotation: 1),
        MiniGame3ButtonInfos(image: "coffee-15", rotation: 2),
        MiniGame3ButtonInfos(image: "coffee-16", rotation: 3)
    ]
}

struct MiniGame3: View {
    
    @StateObject var coffes = ContentX()
    
    let rows = Array(repeating: GridItem(.flexible(), spacing: -20), count: 4)
    
    var body: some View {
        
        HStack {
            
            LazyVGrid(columns: rows, spacing: 25) {
                
                ForEach($coffes.infoX, id: \.image) { $item in
                    CardButton(image: item.image, rotation: item.rotation)
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
