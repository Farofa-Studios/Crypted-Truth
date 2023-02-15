//
//  MiniGame3.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import SwiftUI

struct MiniGame3: View {
    
    @State var degrees: Int = 0
    
    @State var coffes: [MiniGame3ButtonInfos] = [
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
    
    let rows = Array(repeating: GridItem(.flexible(), spacing: -80), count: 4)
    
    var body: some View {
        
        HStack {
            
            LazyVGrid(columns: rows, spacing: 12) {
                
                ForEach(coffes, id: \.image) { item in
                    
                    Button{
                        
    //                    ao selecionar -> ver id,
    //                    somar rotação e modulo 3 (rotation % 3 + 1),
    //                    alterar rotacao da imagem conforme rotation
                    } label: {
                        Image(item.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                    }
                    .buttonStyle(.card)
                    .rotationEffect(.degrees(90 * item.rotation))
                }
            }
            VStack(spacing: 200) {
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

struct MiniGame3_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame3()
    }
}
