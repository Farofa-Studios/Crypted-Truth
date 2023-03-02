//
//  AnagramView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 17/02/23.
//

import SwiftUI
import SwiftUI
import SwiftUI

struct AnagramView: View {
    
    let letters = ["E", "T", "S", "D", "I", "N", "S", "O"]
    @State var anagramaFinal: [String] = []
    
    @FocusState private var isFocusedE: Bool
    @FocusState private var isFocusedT: Bool
    @FocusState private var isFocusedS: Bool
    @FocusState private var isFocusedD: Bool
    @FocusState private var isFocusedI: Bool
    @FocusState private var isFocusedN: Bool
    @FocusState private var isFocusedS1: Bool
    @FocusState private var isFocusedO: Bool
    @FocusState private var isFocusedDesfazer: Bool
    @FocusState private var isFocusedApagar: Bool

    @AppStorage("minigame5") var ok5 = false
    
    var body: some View {
        ZStack {
//            Color.white
//                .ignoresSafeArea()
            
            if !ok5 {
                VStack(spacing: 16){
                    
                    HStack(spacing: 52) {
                        ForEach(anagramaFinal, id: \.self) { test in
                            Text(test)
                                .font(.custom("PTMono-Regular", size: 29))
                                .foregroundColor(.primaryColor)
                        }
                    }
                    .offset(y: -20)
                    .frame(width: 540, height: 60)
                    
                    HStack (spacing: 8) {
                        Button(action: {
                            if anagramaFinal.count > 7 {
                                //
                            } else {
                                anagramaFinal.append("E")
                            }
                        }) {
                            Image("E")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46, height: 44)
                        }
                        .focused($isFocusedE)
                        .background(isFocusedE ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3): Color.clear)
                        .buttonStyle(BoardButtonStyle())
                                                
                        Button(action: {
                            if anagramaFinal.count > 7 {
                                //
                            } else {
                                anagramaFinal.append("T")
                            }
                        }) {
                            Image("T")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46, height: 44)

                        }
                        .focused($isFocusedT)
                        .background(isFocusedT ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                        .buttonStyle(BoardButtonStyle())
                        
                        Button(action: {
                            if anagramaFinal.count > 7 {
                                //
                            } else {
                                anagramaFinal.append("S")
                            }
                        }) {
                            Image("S")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46, height: 44)
                        }
                        .focused($isFocusedS)
                        .background(isFocusedS ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                        .buttonStyle(BoardButtonStyle())
                        
                        Button(action: {
                            if anagramaFinal.count > 7 {
                                //
                            } else {
                                anagramaFinal.append("D")
                            }
                        }) {
                            Image("D")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46, height: 44)
                        }
                        .focused($isFocusedD)
                        .background(isFocusedD ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                        .buttonStyle(BoardButtonStyle())
                        
                        Button(action: {
                            if anagramaFinal.count > 7 {
                                //
                            } else {
                                anagramaFinal.append("I")
                            }
                        }) {
                            Image("I")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46, height: 44)
                        }
                        .focused($isFocusedI)
                        .background(isFocusedI ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                        .buttonStyle(BoardButtonStyle())
                                                                        
                        Button(action: {
                            if anagramaFinal.count > 7 {
                                //
                            } else {
                                anagramaFinal.append("N")
                            }
                        }) {
                            Image("N")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46, height: 44)
                        }
                        .focused($isFocusedN)
                        .background(isFocusedN ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                        .buttonStyle(BoardButtonStyle())
                        
                        
                        Button(action: {
                            if anagramaFinal.count > 7 {
                                //
                            } else {
                                anagramaFinal.append("S")
                            }
                        }) {
                            Image("S")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46, height: 44)
                        }
                        .focused($isFocusedS1)
                        .background(isFocusedS1 ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                        .buttonStyle(BoardButtonStyle())
                                                                        
                        Button(action: {
                            if anagramaFinal.count > 7 {
                                //
                            } else {
                                anagramaFinal.append("O")
                            }
                        }) {
                            Image("O")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46, height: 44)
                        }
                        .focused($isFocusedO)
                        .background(isFocusedO ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                        .buttonStyle(BoardButtonStyle())
                                                
                    }
                    
                    HStack(spacing: 16) {
                        Button {
                            if !anagramaFinal.isEmpty {
                                anagramaFinal.removeLast()
                            }
                        } label: {
                            Image("bt-desfazer")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 190, height: 44)
                            
                        }
                        .buttonStyle(BoardButtonStyle())
                        .focused($isFocusedDesfazer)
                        .background(isFocusedDesfazer ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                        
                        Button {
                            if !anagramaFinal.isEmpty {
                                anagramaFinal.removeAll()
                            }
                        } label: {
                            
                            Image("bt-apagar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 190, height: 44)
            
                        }
                        .buttonStyle(BoardButtonStyle())
                        .focused($isFocusedApagar)
                        .background(isFocusedApagar ? Color(UIColor(red: 0.83, green: 0.16, blue: 0.20, alpha: 1.00)).opacity(0.3) : Color.clear)
                    }
                }
                .frame(width: 540, height: 194)
                
                
            }
            else {
                
                Image("Quadro-Final-Vítima-5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 156, height: 307)
                    .offset(y: -80)
                
                
            }
        }
        .onChange(of: anagramaFinal, perform: { newValue in
            if anagramaFinal == ["S", "E", "N", "T", "I", "D", "O", "S"] {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    ok5 = true
                }
            }
        })
    }
    
}

struct AnagramView_Previews: PreviewProvider {
    static var previews: some View {
        AnagramView()
    }
}

