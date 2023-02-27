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
       
        NavigationStack {
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
                        .resizable()
                        .scaledToFit()
                        .frame(width: 236, height: 236)
                    HStack {
                        ZStack {
                            Image(viewModel.piano.image)
                                .resizable()
                                .frame(width: 236, height: 236)
                                .padding(.trailing, 500)
                            
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
                                .resizable()
                                .frame(width: 236, height: 236)
                                .padding(.leading, 500)
                        }
                    }
                    Image(viewModel.guitar.image)
                        .resizable()
                        .frame(width: 236, height: 236)
                }
                .padding(.top, 75)
                
                Spacer()
                
                if viewModel.isGameOver {
                    GeniusSubtitleView(geniusViewModel: viewModel, avatar: .streamer, image: "sophia-chocada", subtitle: "Aahh! Errei a sequência... Vou ter que recomeçar!")
                        .padding(.top, 20)
                        .padding(.bottom, 175)
                } else {
                    GeniusSubtitleView(geniusViewModel: nil, avatar: .villain, image: "Bot", subtitle: "Deslize para o lado que corresponde ao som na ordem em que escutar...\nMemorize e reproduza a sequência de sons sem errar para liberar mais\ninformações do caso.")
                        .padding(.top, 20)
                        .padding(.bottom, 175)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.darkColor
                    .ignoresSafeArea()
            }
            .onAppear {
                viewModel.playAllRounds()
            }
            .onChange(of: viewModel.didConcludeGame) { newValue in
                if newValue {
                    ok1 = newValue
                }
            }
            .navigationDestination(isPresented: $viewModel.didConcludeGame) {
                GeniusConcludedView(mistakesCounter: viewModel.mistakesCounter)
            }
        }
    }
    
}

struct GeniusView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusView()
    }
}
