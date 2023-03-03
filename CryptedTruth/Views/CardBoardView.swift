//
//  CardBoardView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 14/02/23.
//

import SwiftUI

struct CardBoardView: View {
    
    let victim: Victim
    var cardSubtitles = CardSubtitle.allICardSubtitles
        
    var body: some View {
        
        ZStack {
            
            Color(UIColor(red: 0.09, green: 0.11, blue: 0.13, alpha: 1.00))
                .ignoresSafeArea()
        
            Image("Quadro-Sem")
            Image(victim.card)
            
        }
        
        SubtitleView(subtitle: cardSubtitles[victim.id], buttonAction: nil)
        
    }
}

//struct CardBoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardBoardView()
//    }
//}
