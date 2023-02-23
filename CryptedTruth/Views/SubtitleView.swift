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
            
            Image("person-1")
                .resizable()
                .frame(width: 264, height: 200)
            
            ZStack {
                Rectangle()
                    .frame(width: 1320, height: 200, alignment: .center)
                    .foregroundColor(Color.backgroundSubtitle)
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
