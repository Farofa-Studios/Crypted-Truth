//
//  TypedText.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 27/02/23.
//

import Foundation
import SwiftUI

struct TypedText: View {
    let text: String
    @State private var typedText: String = ""
    
    var body: some View {
        Text(typedText)
            .onAppear {
                for index in text.indices {
                    let character = text[index]
                    let deadline = DispatchTime.now() + Double(text.distance(from: text.startIndex, to: index)) * 0.05
                    DispatchQueue.main.asyncAfter(deadline: deadline) {
                        typedText += String(character)
                    }
                }
            }
    }
}





