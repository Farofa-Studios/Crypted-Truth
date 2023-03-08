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
    @AppStorage("minigame4") var ok4 = false

    var body: some View {
       
        NavigationStack {
            VStack {
                HStack {
                    
                    VStack {
                        Text("Rodada")
                            .font(.custom("PTMono-Regular", size: 38))
                            .padding(.bottom, 10)
                        Text("\(viewModel.roundCounter)/\(viewModel.matchInstruments.count)")
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
                        ZStack {
                            Image(viewModel.piano.image)
                                .padding(.trailing, 500)
                            
                            VStack(alignment: .center) {
                                
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
                                
                            }
                            .frame(width: 170, height: 170)
                            .background {
                                Color.darkRedColor
                            }
                            
                            Image(viewModel.tambourine.image)
                                .padding(.leading, 500)
                        }
                    }
                    Image(viewModel.guitar.image)
                }
                .padding(.top, 75)
                
                Spacer()
                
                if viewModel.isGameOver {
                    GeniusSubtitleView(geniusViewModel: viewModel, avatar: .streamer, image: "sophia-chocada", subtitle: "Aahh! Errei a sequência... Vou ter que recomeçar!")
                        .padding(.top, 20)
                        .padding(.bottom, 175)
                } else {
                    GeniusSubtitleView(geniusViewModel: viewModel, avatar: .villain, image: "Bot", subtitle: "Deslize para a direção que corresponde ao som na ordem em que escutar...\nMemorize e reproduza a sequência de sons sem errar para liberar mais\ninformações do caso.")
                        .padding(.top, 20)
                        .padding(.bottom, 175)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.darkColor
                    .ignoresSafeArea()
            }
            .foregroundColor(.white)
            .onChange(of: viewModel.playerInputDirection) { newValue in
                if newValue != nil {
                    viewModel.evalPlayerInput()
                }
            }
            .onChange(of: viewModel.didConcludeGame) { newValue in
                if newValue {
                    ok4 = newValue
                }
            }
            .navigationDestination(isPresented: $viewModel.didConcludeGame) {
                GeniusConcludedView(roundsCounter: viewModel.matchInstruments.count, mistakesCounter: viewModel.mistakesCounter)
            }
        }
        
    }
    
}

struct GeniusView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusView()
    }
}
