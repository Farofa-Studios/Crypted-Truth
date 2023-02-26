//
//  AnagramView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 17/02/23.
//

import SwiftUI

struct AnagramView: View {
    
    let letters = ["E", "T", "S", "D", "I", "N", "S", "O"]
    @State var anagramaFinal: [String] = []
    @AppStorage("minigame5") var ok5 = false
    
    var body: some View {
        ZStack {
//            Color.gray
//                .ignoresSafeArea()
            
            if !ok5 {
                VStack(spacing: 16){
                    
                    Text("\(anagramaFinal.joined(separator: " "))")
                        .font(.custom("PTMono-Regular", size: 29))
                        .foregroundColor(.primaryColor)
                        .padding(.top, 16)
                        .padding()
                    
                    HStack (spacing: 8) {
                        ForEach(letters, id: \.self) { letter in
                            Button(action: {
                                if anagramaFinal.count > 7 {
                                    //
                                } else {
                                    anagramaFinal.append(letter)
                                }
                            }) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 52, height: 50)
                                    Text("\(letter)")
                                        .font(.custom("PTMono-Regular", size: 29))
                                        .foregroundColor(.primaryColor)
                                }
                                
                            }
                            .buttonStyle(.card)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            
                        }
                    }
                    
                    
                    
                    HStack(spacing: 16) {
                        Button {
                            if !anagramaFinal.isEmpty {
                                anagramaFinal.removeLast()
                            }
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: "delete.left")
                                    .foregroundColor(.primaryColor)
                                Text("Desfazer")
                                    .font(.custom("PTMono-Regular", size: 25))
                                    .foregroundColor(.primaryColor)
                            }
                            .frame(width: 190, height: 44)

                        }
                        .buttonStyle(.card)
                        .clipShape(Rectangle())
                        
                        Button {
                            if !anagramaFinal.isEmpty {
                                anagramaFinal.removeAll()
                            }
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: "trash")
                                    .foregroundColor(.primaryColor)
                                Text("Apagar")
                                    .font(.custom("PTMono-Regular", size: 25))
                                    .foregroundColor(.primaryColor)
                            }
                            .frame(width: 190, height: 44)

                        }
                        .buttonStyle(.card)
                        .clipShape(Rectangle())
                        
                    }
                }
                
            }
            else {
                Image("Quadro-Final-Vítima-5")
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

//let finalText: String = "Hello, World!"
//let writing = false

//    extension String {
//        subscript(offset: Int) -> Character {
//            self[index(startIndex, offsetBy: offset)]
//        }
//    }

//VStack(spacing: 16.0) {
//            ZStack {
//                //SubtitleView()
//                Text(text)
//
//            }
//            Button("Type") {
//                typeWriter()
//            }
//
//
//
//        }
//        .onAppear() {
//            OK4 = true
//        }
//
//    }
//
//    func typeWriter(at position: Int = 0) {
//            if position == 0 {
//                text = ""
//            }
//            if position < finalText.count {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                    text.append(finalText[position])
//                    typeWriter(at: position + 1)
//                }
//            }
//        }

//@AppStorage("minigame4") var OK4 = false

