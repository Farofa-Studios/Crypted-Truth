//
//  FinalView.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 27/02/23.
//

import Foundation
import SwiftUI

struct FinalView: View {
    
//    let imagesIntroductionList = ["Fim-Stream-1", "Fim-Stream-2", "Fim-Stream-3", "Fim-Stream-4"]
    
    let imagesIntroductionList = ["Fim-Stream-4"]
    
    var subtitlesList = FinalSubtitles.allIntroductionSubtitles
    
    @ObservedObject var viewModel = FinalViewModel()
    
    @State var over: Bool = false
    
    func buttonAction(){
        print("viewModel.index: ", viewModel.index)
        if viewModel.index == imagesIntroductionList.count - 1 {
            
            viewModel.isFinalDone = true
            
            over = true
             
            // zerar o jogo
            
//            @AppStorage("introduction") var introduction = false
//            @AppStorage("minigame1") var ok1 = false
//            @AppStorage("minigame2") var ok2 = false
//            @AppStorage("minigame3") var ok3 = false
//            @AppStorage("minigame4") var ok4 = false
//            @AppStorage("minigame5") var ok5 = false
//            @AppStorage("anagramConcluido") var anagramShowing = false
            
        } else {
            
            viewModel.index += 1
        }
    }
    
    var body: some View {
        NavigationView(){
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                VStack{
                    
                    if viewModel.index == imagesIntroductionList.count - 1 {
                        
                        ZStack {
                            Image(imagesIntroductionList[viewModel.index])
                                .resizable()
                                .ignoresSafeArea()
                                .onAppear() {
                                    buttonAction()
                                }
                            
                            NavigationLink {
                                
                                
                                
                            } label: {
                                Text("Continuaanna...")
                            }
                            .buttonStyle(BoardButtonStyle())
                        }
                        
                    } else {
                        
                        Image(imagesIntroductionList[viewModel.index])
                            .resizable()
                            .frame(width: 1320, height: 742.5)
                        
                        SubtitleView(subtitle: subtitlesList[viewModel.index], buttonAction: buttonAction)
                    }
                }
            }
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
