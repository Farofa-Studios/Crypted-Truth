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
        
        ZStack {
            
            Color(UIColor(red: 0.09, green: 0.11, blue: 0.13, alpha: 1.00))
                .ignoresSafeArea()
        
            Image("Quadro")
            Image(victim.card)
            
        }
        
//        SubtitleView()
        
    }
}

//struct CardBoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardBoardView()
//    }
//}
