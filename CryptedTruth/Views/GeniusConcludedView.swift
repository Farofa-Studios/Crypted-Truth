//
//  GeniusConcludedView.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 26/02/23.
//

import Foundation
import SwiftUI

struct GeniusConcludedView: View {
    
    let mistakesCounter: Int
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.darkColor
                    .ignoresSafeArea()
                
                HStack {
                    
                    VStack {
                        Text("Rodada")
                            .font(.custom("PTMono-Regular", size: 38))
                            .padding(.bottom, 10)
                        Text("9/9")
                            .font(.custom("PTMono-Regular", size: 50))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Erros")
                            .font(.custom("PTMono-Regular", size: 38))
                            .padding(.bottom, 10)
                        Text("\(mistakesCounter)")
                            .font(.custom("PTMono-Regular", size: 50))
                    }
                    
                }
                .padding(.horizontal, 100)
                .offset(y: -400)
                
                VStack {
                                        
                    VStack {
                        Text("Desafio concluído.")
                            .font(.custom("PTMono-Regular", size: 76))
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 498, height: 70)
                                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.1))
                            
                            Text("Novas informações liberadas")
                                .font(.custom("FuzzyBubbles-Regular", size: 31))
                        }
                        
                        NavigationLink {
                            BoardView()
                        } label: {
                            
                            Image("bt-voltar")
                                .resizable()
                                .frame(width: 724, height: 102)
                            
                        }
                        .buttonStyle(.card)
                        .offset(y: 156)
                    }
                    .frame(width: 1320, height: 742.5)
                    
                    if mistakesCounter == 0 {
                        GeniusSubtitleView(geniusViewModel: nil, avatar: .streamer, image: "sophia-animada", subtitle: "Ah gente, achei fácil! Já terminamos o desafio e liberamos as informações da vítima, vamos dar uma olhada no quadro.")
                    } else {
                        GeniusSubtitleView(geniusViewModel: nil, avatar: .streamer, image: "sophia-chocada", subtitle: "Ufa! Foi difícil, mas conseguimos! Terminamos o desafio e liberamos as informações dessa vítima! Vamos dar uma olhada no quadro.")
                    }
                    
                }
            }
        }
    }
}

struct GeniusConcludedView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusConcludedView(mistakesCounter: 0)
        GeniusConcludedView(mistakesCounter: 2)
    }
}
