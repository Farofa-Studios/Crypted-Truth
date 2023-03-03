//
//  InitialView.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 26/02/23.
//

import Foundation
import SwiftUI

struct InitialView: View {
    
    @ObservedObject var viewModel = IntroductionViewModel()
    
    @AppStorage("introduction") var introduction = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Image("Início")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                NavigationLink {
                    
                    if introduction {
                        BoardView()
                    } else {
                        IntroductionView()
                    }
                
                } label: {
                    
                    Image("bt-Iniciar")
                        .resizable()
                        .frame(width: 529, height: 110)
                    
                }
                .buttonStyle(.card)
                .offset( x: -540, y: 370)
                
            }
        }
        .onAppear() {
            SoundManager.instance.playSoundMP3(sound: "Spooky", loops: -1)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
