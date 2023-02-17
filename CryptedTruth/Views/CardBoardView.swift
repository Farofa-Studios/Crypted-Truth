//
//  CardBoardView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 14/02/23.
//

import SwiftUI

struct CardBoardView: View {
    
    let victim: Victim
        
    var body: some View {
        
        VStack {
            Image(victim.picture)
                .resizable()
                .frame(width: 140, height: 175)
            Text(victim.name)
        }
        .frame(width: 1320, height: 742.5)
        
        SubtitleView()
        
    }
}

//struct CardBoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardBoardView()
//    }
//}
