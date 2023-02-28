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
    
    @ObservedObject var viewModel = IntroductionViewModel()
    
    @AppStorage("introduction") var introduction = false
    
    func buttonAction() {
        if viewModel.index == 4 {
            introduction = true
            viewModel.isIntroductionDone = true
        } else {
            viewModel.index += 1
            SoundManager.instance.playSoundM4A(sound: subtitlesList[viewModel.index].audio, loops: 0)
        }
    }
    
    var body: some View {
        NavigationStack() {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                VStack{
                    
                    Image(imagesIntroductionList[viewModel.index])
                        .resizable()
                        .frame(width: 1320, height: 742.5)
                    
                    
                    SubtitleView(subtitle: subtitlesList[viewModel.index], buttonAction: buttonAction)
                    
                } .navigationDestination(isPresented: $viewModel.isIntroductionDone) {
                    BoardView()
                }
                
            }
        }
        .onAppear {
            SoundManager.instance.playSoundM4A(sound: subtitlesList[viewModel.index].audio, loops: 0)
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}

