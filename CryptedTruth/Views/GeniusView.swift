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
    @AppStorage("minigame1") var OK1 = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack {
                    Text("Rodada")
                    Text("\(viewModel.round)/9")
                }
                
                Spacer()
                
                VStack {
                    Text("Erros")
                    Text("\(viewModel.mistakes)")
                }
                
            }
            
            Spacer()
            
            VStack {
                Image("up-default")
                HStack {
                    Image("left-default")
                    Text("Ouça")
                        .padding(.horizontal, 25)
                    Image("right-default")
                }
                Image("down-default")
            }
            
            Spacer()
            
            HStack {
                
                VStack {
                    Text("Deslize para o lado que corresponde ao som na ordem em que escutar... Memorize e reproduza a sequência de sons sem errar para liberar mais informações do caso.")
                }
                .border(.red, width: 1)
                
                VStack {
                    Text("bot tutorial")
                }
                .border(.red, width: 1)
                
                
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.darkColor
        }
        .ignoresSafeArea()
        .onAppear {
            
            print(viewModel.matchDirections)
            GeniusViewModel.getDirections(directionHandler: { direction in
                print(direction)
            })
            
            OK1 = true
        }
        
    }
}

struct GeniusView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusView()
    }
}
