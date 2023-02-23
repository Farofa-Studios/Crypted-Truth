//
//  BoardView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 14/02/23.
//

import SwiftUI

struct BoardView: View {

    let columns =
    [GridItem(.fixed(824)), GridItem(.fixed(824))]
    
    @StateObject var victims = Victims()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkColor
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        Image("Quadro")

                        LazyVGrid(columns: columns, spacing: 168) {
                            ForEach($victims.allVictims, id: \.id) { $victim in
                                ZStack {
                                    
                                    NavigationLink {
//                                        CardBoardView(victim: victim)
                                        victim.minigame
                                        //victim.tapped.toggle()


                                    } label: {
                                        Image("\(victim.firstPicture)")
                                    }
                                    .buttonStyle(.card)
                                }
                            }
                        }
                        .frame(width: 1320, height: 742.5)
                        
                    }
                    
                    SubtitleView()
                    
                }
                                
                // Espaco para letras liberadas
                
//                LazyHStack {
//                    ForEach(Victims.allVictims, id: \.id) { victim in
//
//                            Text("\(victim.letters[0])")
//                            .foregroundColor(.primary1Color)
//                            Text("\(victim.letters[1])")
//                            .foregroundColor(.primary1Color)
//
//                    }
//                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
