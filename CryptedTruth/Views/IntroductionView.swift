//
//  IntroductionView.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 26/02/23.
//

import Foundation
import SwiftUI

struct IntroductionView: View {
    
    let imagesIntroductionList = ["Intro-Stream-1", "Intro-Stream-2", "Intro-Stream-3", "Intro-Stream-4", "Intro-Stream-1"]
    
    var subtitlesList = IntroductionSubtitles.allIntroductionSubtitles
    
    @State var index: Int
    @State var isIntroductionDone: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                VStack{
                    
                    Image(imagesIntroductionList[index])
                        .resizable()
                        .frame(width: 1320, height: 742.5)
                    
                    HStack (alignment: .center, spacing: 16) {
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 1320, height: 200, alignment: .center)
                                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.1))
                            
                            VStack (spacing: 0) {
                                
                                Text(subtitlesList[index])
                                    .frame(width: 1255.81, height: 120, alignment: .leading)
                                    .font(.custom("PTMono-Regular", size: 29))
                                    .lineSpacing(5)
                                    .lineLimit(10)
                                             
                                Button(action: {
                                    
                                    if index == 4 {
                                        isIntroductionDone = true
                                    } else {
                                        index += 1
                                    }
                                    
                                }) {
                                    
                                    Image("Next")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 32, height: 39, alignment: .center)
                                }
                                .buttonStyle(.card)
                                .clipShape(Triangle())
                                .offset( x: 600, y: 0)
                            }
                        }
                    }
                }
            }
            
            .navigationDestination(isPresented: $isIntroductionDone) {
                BoardView()
            }
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(index: 0)
    }
}

