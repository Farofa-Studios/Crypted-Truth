//
//  AnagramView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 17/02/23.
//

import SwiftUI

struct AnagramView: View {
    
    let rows =
    [GridItem(.flexible())]
    
    @State var text: String = ""
       let finalText: String = "Hello, World!"
    let writing = false
    
    var body: some View {
//        ZStack {
////            Color(.blue)
////                .ignoresSafeArea()
//            VStack {
//
//                LazyHGrid(rows: rows, spacing: 8) {
//                    Button("T") {}
//                    Button("S") {}
//                    Button("D") {}
//                    Button("N") {}
//                    Button("S") {}
//                    Button("I") {}
//                    Button("E") {}
//                    Button("O") {}
//
//                }
//
//                HStack(spacing: 16) {
//                    Button {
//                        //
//                    } label: {
//                        HStack(spacing: 12) {
//                            Image(systemName: "delete.left")
//                            Text("Desfazer")
//                        }
//                    }
//
//                    Button {
//                        //
//                    } label: {
//                        HStack(spacing: 12) {
//                            Image(systemName: "trash")
//                            Text("Apagar")
//                        }
//                    }
//
//                }
//
//            }
//        }
   
        VStack(spacing: 16.0) {
            ZStack {
                SubtitleView()
                Text(text)
                        
            }
            Button("Type") {
                typeWriter()
            }
            
            
            
        }
        
    }
    
    func typeWriter(at position: Int = 0) {
            if position == 0 {
                text = ""
            }
            if position < finalText.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    text.append(finalText[position])
                    typeWriter(at: position + 1)
                }
            }
        }
}

struct AnagramView_Previews: PreviewProvider {
    static var previews: some View {
        AnagramView()
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
