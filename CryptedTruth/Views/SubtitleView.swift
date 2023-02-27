//
//  SubtitleView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 16/02/23.
//

import SwiftUI

struct SubtitleView: View {
    
    var body: some View {
        HStack (alignment: .center, spacing: 16) {
            
            Image("Bot")
                .resizable()
                .frame(width: 264, height: 200)
            
            ZStack {
                Rectangle()
                    .frame(width: 1320, height: 200, alignment: .center)
                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.1))
                Text("Hello blablabla")
                    .frame(width: 1255.81, height: 120, alignment: .leading)
            }
            
        }
    }
}

struct SubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleView()
    }
}
