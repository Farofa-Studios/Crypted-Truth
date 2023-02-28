//
//  GeniusSubtitleView.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 26/02/23.
//

import Foundation
import SwiftUI

struct GeniusSubtitleView: View {
    
    let geniusViewModel: GeniusViewModel?
    
    let avatar: Avatars
    let image: String
    let subtitle: String
    
    var body: some View {
        HStack (alignment: .center, spacing: 16) {
            
            if avatar == .streamer {
                Image(image)
                    .resizable()
                    .frame(width: 264, height: 200)
            }
            
            ZStack {
                Text(subtitle)
                    .frame(width: 1255.81, height: 120, alignment: .leading)
                    .font(.custom("PTMono-Regular", size: 29))
                
//                if image == "sophia-chocada" {
//                    VStack {
//                        Spacer()
//                        HStack {
//                            Spacer()
//                            Button(action: {
//                                geniusViewModel!.restartGame()
//                            }, label: {
//                                Image("Next")
//                            })
//                            .buttonStyle(BlankButtonStyle())
//                        }
//                    }
//                    .padding(.bottom, 16)
//                    .padding(.trailing, 16)
//                }
                
            }
            .frame(width: 1320, height: 200, alignment: .center)
            .background {
                Color(red: 1, green: 1, blue: 1, opacity: 0.1)
            }
            
            if avatar == .villain {
                Image(image)
                    .resizable()
                    .frame(width: 264, height: 200)
            }
            
        }
    }
}

struct GeniusSubtitleView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GeniusSubtitleView(geniusViewModel: nil, avatar: .villain, image: "Bot", subtitle: "Deslize para o lado que corresponde ao som na ordem em que escutar...\nMemorize e reproduza a sequência de sons sem errar para liberar mais\ninformações do caso.")
        
        GeniusSubtitleView(geniusViewModel: GeniusViewModel(), avatar: .streamer, image: "sophia-chocada", subtitle: "Aahh! Errei a sequência... Vou ter que recomeçar!")
        
    }
    
}
