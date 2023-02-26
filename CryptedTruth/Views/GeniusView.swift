//
//  ContentView.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 13/02/23.
//

import SwiftUI
import GameController

struct GeniusView: View {
    
    @ObservedObject var viewModel = GeniusViewModel()
    @AppStorage("minigame1") var ok1 = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack {
                    Text("Rodada")
                        .font(.custom("PTMono-Regular", size: 38))
                        .padding(.bottom, 10)
                    Text("\(viewModel.roundCounter)/9")
                        .font(.custom("PTMono-Regular", size: 50))
                }
                
                Spacer()
                
                VStack {
                    Text("Erros")
                        .font(.custom("PTMono-Regular", size: 38))
                        .padding(.bottom, 10)
                    Text("\(viewModel.mistakesCounter)")
                        .font(.custom("PTMono-Regular", size: 50))
                }
                
            }
            .padding(.horizontal, 100)
            .offset(y: 215)
            
            Spacer()
            
            VStack {
                Image(viewModel.sax.image)
                HStack {
                    Image(viewModel.piano.image)
                    if viewModel.isPlayerTurn {
                        Text("Sua\nvez")
                            .padding(.horizontal, 25)
                            .font(.custom("PTMono-Bold", size: 48))
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Ouça")
                            .padding(.horizontal, 25)
                            .font(.custom("PTMono-Bold", size: 48))
                    }
                    Image(viewModel.tambourine.image)
                }
                Image(viewModel.guitar.image)
            }
            .padding(.top, 75)
            
            Spacer()
            
            Image("instructions")
                .padding(.top, 20)
                .padding(.bottom, 175)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.darkColor
                .ignoresSafeArea()
        }
        .onAppear {
            viewModel.playAllRounds()
            ok1 = true
        }
        
    }
}

struct GeniusView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusView()
    }
}
