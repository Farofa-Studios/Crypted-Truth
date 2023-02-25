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
    
    @State private var victims = Victim.allVictims()
    
    // conferir se os minigames foram concluídos
    @AppStorage("minigame1") var ok1 = false
    @AppStorage("minigame2") var ok2 = false
    @AppStorage("minigame3") var ok3 = false
    @AppStorage("minigame4") var ok4 = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkColor
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        
                        Image("Quadro")
                        
                        LazyVGrid(columns: columns, spacing: 168) {
                            
                            ForEach(victims, id: \.id) { victim in
                                ZStack {
                                    
                                    if victim.tapped {
                                        NavigationLink {
                                            
                                            CardBoardView(victim: victim)
                                            
                                        } label: {
                                            Image("\(victim.picture)")
                                        }
                                        .buttonStyle(.card)
                                    }
                                    else {
                                        NavigationLink {
                                            
                                            victim.minigame
                                            
                                        } label: {
                                            Image("\(victim.firstPicture)")
                                        }
                                        .buttonStyle(.card)
                                    }
                                }
                            }
                        }
                        .frame(width: 1320, height: 742.5)
                        .onAppear() {
                            if ok1 {
                                victims[0].tapped = true
                            }
                            if ok2 {
                                victims[1].tapped = true
                            }
                            if ok3 {
                                victims[2].tapped = true
                            }
                            if ok4 {
                                victims[3].tapped = true
                            }
                        }
                        
                        LazyHStack(spacing: 36) {
                            
                            ForEach(victims, id: \.id) { victim in
                                
                                if victim.tapped {
                                    Text("\(victim.letters[0])")
                                        .foregroundColor(.primaryColor)
                                        .font(.custom("PTMono-Regular", size: 29))
                                    Text("\(victim.letters[1])")
                                        .foregroundColor(.primaryColor)
                                        .font(.custom("PTMono-Regular", size: 29))
                                }
                                
                            }
                        }
                        .offset(y: 80)
                        
                    }
                    
                    SubtitleView()
                    
                }
                
                // Espaco para letras liberadas
                
                
            }
        }
        
    }
}


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
