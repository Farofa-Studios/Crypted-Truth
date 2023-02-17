//
//  BoardView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 14/02/23.
//

import SwiftUI

struct BoardView: View {
    
    //@StateObject var viewModel = VictimViewModel()
    @State private var name: String = ""

    
    let columns =
    [GridItem(.fixed(824)), GridItem(.fixed(824))]
        
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color(UIColor(red: 0.09, green: 0.11, blue: 0.13, alpha: 1.00))
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        Image("Quadro")

                        LazyVGrid(columns: columns, spacing: 168) {
                            ForEach(Victims.allVictims, id: \.id) { victim in
                                ZStack {
                                    
                                    NavigationLink {
                                        CardBoardView(victim: victim)
                                    } label: {
                                        Image("\(victim.picture)")
                                    }
                                    .buttonStyle(.card)
                                }
                            }
                        }
                        .frame(width: 1320, height: 742.5)
                        
                    }
                    
                    SubtitleView()
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
