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
            LazyVGrid(columns: columns) {
                ForEach(Victims.allVictims, id: \.id) { victim in
                    NavigationLink {
                        CardBoardView(victim: victim)
                    } label: {
                        Image("\(victim.picture)")
                            .resizable()
                            .frame(width: 140, height: 175)
                    }
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
