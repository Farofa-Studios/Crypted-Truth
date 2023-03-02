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
                        Text("\(viewModel.roundCounter)/5")
                            .font(.custom("PTMono-Regular", size: 50))
                    }
                    
                    Spacer()
                    
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
                    
                    Spacer()
                    
                    VStack {
                        Text("Erros")
                            .font(.custom("PTMono-Regular", size: 38))
                            .padding(.bottom, 10)
                        Text("\(viewModel.mistakesCounter)")
                            .font(.custom("PTMono-Regular", size: 50))
                    }
                    
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        viewModel.evalPlayerInput(playerInput: viewModel.sax)
                    }) {
                        VStack {
                            Image(viewModel.sax.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 270, height: 270, alignment: .center)
                            Spacer()
                            Spacer()
                        }
                        .frame(width: 236, height: 236, alignment: .center)
                    }
                    .clipShape(Pentagon())
                    .disabled(!viewModel.isPlayerTurn)
                    
                    Button(action: {
                        viewModel.evalPlayerInput(playerInput: viewModel.piano)
                    }) {
                        VStack {
                            Image(viewModel.piano.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 270, height: 270, alignment: .center)
                            Spacer()
                            Spacer()
                        }
                        .frame(width: 236, height: 236, alignment: .center)
                    }
                    .clipShape(Pentagon())
                    .disabled(!viewModel.isPlayerTurn)
                    
                    Button(action: {
                        viewModel.evalPlayerInput(playerInput: viewModel.tambourine)
                    }) {
                        VStack {
                            Image(viewModel.tambourine.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 270, height: 270, alignment: .center)
                            Spacer()
                            Spacer()
                        }
                        .frame(width: 236, height: 236, alignment: .center)
                    }
                    .clipShape(Pentagon())
                    .disabled(!viewModel.isPlayerTurn)
                    
                    Button(action: {
                        viewModel.evalPlayerInput(playerInput: viewModel.guitar)
                    }) {
                        VStack {
                            Image(viewModel.guitar.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 270, height: 270, alignment: .center)
                            Spacer()
                            Spacer()
                        }
                        .frame(width: 236, height: 236, alignment: .center)
                    }
                    .clipShape(Pentagon())
                    .disabled(!viewModel.isPlayerTurn)
                    
                }
                
                Spacer()
                
                if viewModel.isGameOver {
                    GeniusSubtitleView(geniusViewModel: viewModel, avatar: .streamer, image: "sophia-chocada", subtitle: "Aahh! Errei a sequência... Vou ter que recomeçar!")
                } else {
                    GeniusSubtitleView(geniusViewModel: nil, avatar: .villain, image: "Bot", subtitle: "Escolha o instrumento que corresponde ao som na ordem em que escutar...\nMemorize e reproduza a sequência de sons sem errar para liberar mais\ninformações do caso.")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.darkColor
                    .ignoresSafeArea()
            }
            .foregroundColor(.white)
            .onAppear {
                viewModel.playCurrentRound()
            }
            .onChange(of: viewModel.didConcludeGame) { newValue in
                if newValue {
                    //ok1 = newValue
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
