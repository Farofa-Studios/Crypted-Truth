//
//  InitialView.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 26/02/23.
//

import Foundation
import SwiftUI

struct InitialView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("Início")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                NavigationLink {
                    
                    IntroductionView(index: 0)
                    
                } label: {
                    
                    Image("bt-Iniciar")
                        .resizable()
                        .frame(width: 529, height: 110)
                    
                }
                .buttonStyle(.card)
                .offset( x: -540, y: 370)
                
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
