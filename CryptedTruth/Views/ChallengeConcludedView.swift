//
//  ChallengeConcludedView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 25/02/23.
//

import SwiftUI

struct ChallengeConcludedView: View {
    
    @State private var victims = Victim.allVictims()
    
    var body: some View {
        
        
        ZStack {
            Color.darkColor
                .ignoresSafeArea()
            
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
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(width: 724, height: 102)
                                .foregroundColor(Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)))
                            Text("Voltar para o quadro de evidências")
                                .font(.custom("PTMono-Regular", size: 31))
                                .foregroundColor(.white)
                            
                        }
                        
                    }
                    .buttonStyle(.card)
                    .offset(y: 156)
                }
                .frame(width: 1320, height: 742.5)
                //                    SubtitleView()
            }
        }
        
    }
}

struct ChallengeConcludedView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeConcludedView()
    }
}
