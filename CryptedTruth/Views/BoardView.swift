//
//  BoardView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 14/02/23.
//

import SwiftUI

struct BoardView: View {
    
    let columns =
    [GridItem(.fixed(846)), GridItem(.fixed(846))]
    
    @State private var victims = Victim.allVictims()
    
    // conferir se os minigames foram concluídos
    @AppStorage("minigame1") var ok1 = false
    @AppStorage("minigame2") var ok2 = false
    @AppStorage("minigame3") var ok3 = false
    @AppStorage("minigame4") var ok4 = false
    @AppStorage("minigame5") var ok5 = false
    @AppStorage("anagramConcluido") var anagramShowing = false
    
    @State var lettersAnagram = [String]()
    
    @FocusState private var isFocusedV: Bool
    @FocusState private var isFocusedV1: Bool
    @FocusState private var isFocusedS: Bool
    @FocusState private var isFocusedS1: Bool
    @FocusState private var isFocusedM: Bool
    @FocusState private var isFocusedM1: Bool
    @FocusState private var isFocusedSA: Bool
    @FocusState private var isFocusedSA1: Bool


    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkColor
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        
                        Image("Quadro-Sem")
                        
                        LazyVGrid(columns: columns, spacing: 168) {
                            
                            if victims[0].tapped {
                                NavigationLink {

                                    CardBoardView(victim: victims[0])

                                } label: {
                                    Image(ok5 ? "\(victims[0].finalPicture)" :  "\(victims[0].picture)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: ok5 ? 487 : 336, height: 223)
                                }
                                .focused($isFocusedV)
                                .background(isFocusedV ? Color.white.opacity(0.2) : Color.clear)
                                .buttonStyle(BoardButtonStyle())
                                .offset(x: ok5 ? 80 : 0)

                            }
                            else {
                                NavigationLink {

                                    victims[0].minigame

                                } label: {
                                    Image("\(victims[0].firstPicture)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 336, height: 223)
                                }
                                .focused($isFocusedV1)
                                .background(isFocusedV1 ? Color.white.opacity(0.2) : Color.clear)
                                .buttonStyle(BoardButtonStyle())
                            }
                            
                            if victims[1].tapped {
                                NavigationLink {

                                    CardBoardView(victim: victims[1])

                                } label: {
                                    Image(ok5 ? "\(victims[1].finalPicture)" :  "\(victims[1].picture)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: ok5 ? 487 : 336, height: 223)
                                }
                                .focused($isFocusedS)
                                .background(isFocusedS ? Color.white.opacity(0.2) : Color.clear)
                                .buttonStyle(BoardButtonStyle())
                                .offset(x: ok5 ? -80 : 0)

                            }
                            else {
                                NavigationLink {

                                    victims[1].minigame

                                } label: {
                                    Image("\(victims[1].firstPicture)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 336, height: 223)
                                }
                                .focused($isFocusedS1)
                                .background(isFocusedS1 ? Color.white.opacity(0.2) : Color.clear)
                                .buttonStyle(BoardButtonStyle())
                            }
                            
                            if victims[2].tapped {
                                NavigationLink {

                                    CardBoardView(victim: victims[2])

                                } label: {
                                    Image(ok5 ? "\(victims[2].finalPicture)" :  "\(victims[2].picture)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: ok5 ? 487 : 336, height: 223)
                                }
                                .focused($isFocusedM)
                                .background(isFocusedM ? Color.white.opacity(0.2) : Color.clear)
                                .buttonStyle(BoardButtonStyle())
                                .offset(x: ok5 ? 80 : 0)

                            }
                            else {
                                NavigationLink {

                                    victims[2].minigame

                                } label: {
                                    Image("\(victims[2].firstPicture)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 336, height: 223)
                                }
                                .focused($isFocusedM1)
                                .background(isFocusedM1 ? Color.white.opacity(0.2) : Color.clear)
                                .buttonStyle(BoardButtonStyle())
                            }
                            
                            if victims[3].tapped {
                                NavigationLink {

                                    CardBoardView(victim: victims[3])

                                } label: {
                                    Image(ok5 ? "\(victims[3].finalPicture)" :  "\(victims[3].picture)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: ok5 ? 487 : 336, height: 223)
                                }
                                .focused($isFocusedSA)
                                .background(isFocusedSA ? Color.white.opacity(0.2) : Color.clear)
                                .buttonStyle(BoardButtonStyle())
                                .offset(x: ok5 ? -80 : 0)

                            }
                            else {
                                NavigationLink {

                                    victims[3].minigame

                                } label: {
                                    Image("\(victims[3].firstPicture)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 336, height: 223)
                                }
                                .focused($isFocusedSA1)
                                .background(isFocusedSA1 ? Color.white.opacity(0.2) : Color.clear)
                                .buttonStyle(BoardButtonStyle())
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
                        
                        // Espaco para letras liberadas
                        
                        if !anagramShowing {
                            LazyHStack(spacing: 36) {
                                
                                ForEach(victims, id: \.id) { victim in
                                    
                                    if victim.tapped {
                                        
                                        Text("\(victim.letters[0])")
                                            .foregroundColor(.primaryColor)
                                            .font(.custom("PTMono-Regular", size: 29))
                                            .onAppear(){
                                                lettersAnagram.append("\(victim.letters[0])")
                                                print(lettersAnagram.count)

                                            }
                                        
                                        Text("\(victim.letters[1])")
                                            .foregroundColor(.primaryColor)
                                            .font(.custom("PTMono-Regular", size: 29))
                                            .onAppear(){
                                                lettersAnagram.append("\(victim.letters[1])")
                                                print(lettersAnagram.count)

                                            }
                                                                                
                                    }
                                    
                                }
                                
                            }
                            .offset(y: 80)
                            .onChange(of: lettersAnagram) { newValue in
                                if lettersAnagram.count == 8 {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        anagramShowing = true
                                    }
                                }
                                
                            }
                        }
                        
                        else if anagramShowing {
                            AnagramView()
                                .offset(y: 80)
                        }
                        
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
