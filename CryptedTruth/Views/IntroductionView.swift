//
//  IntroductionView.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 26/02/23.
//

import Foundation
import SwiftUI

struct IntroductionView: View {
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                VStack{
                    
                    Image("Intro-Stream-1")
                        .resizable()
                        .frame(width: 1320, height: 742.5)
                    
                    HStack (alignment: .center, spacing: 16) {
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 1320, height: 200, alignment: .center)
                                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.1))
                            
                            VStack {
                                
                                Text("Hello blablabla")
                                    .frame(width: 1255.81, height: 120, alignment: .leading)
                                
//                                NavigationLink {
//
//                                    BoardView()
//
//                                } label: {
//                                    Image("Next")
//                                        .buttonStyle(.card)
//                                }
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}

