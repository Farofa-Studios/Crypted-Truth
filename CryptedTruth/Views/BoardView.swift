//
//  BoardView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 14/02/23.
//

import SwiftUI

struct BoardView: View {
    
    @StateObject var viewModel = VictimViewModel()
    
    let columns =
    [GridItem(.flexible()), GridItem(.flexible())]
        
    var body: some View {
        NavigationStack {
            
            VStack {
                LazyVGrid(columns: columns, spacing: 168) {
                    ForEach(Victims.allVictims, id: \.id) { victim in
                        ZStack {
                            Rectangle()
                                .frame(width: 316, height: 220)
                                .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                            
                            NavigationLink {
                                CardBoardView(victim: victim)
                            } label: {
                                Image("\(victim.picture)")
                                    .resizable()
                                    .frame(width: 140, height: 175)
                            }
                            .buttonStyle(.card)
                        }
                    }
                }
                .frame(width: 1320, height: 742.5)
                
                SubtitleView()
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
