//
//  SubtitleView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 16/02/23.
//

import SwiftUI

struct SubtitleView: View {
    
    let subtitle: Subtitle
    let buttonAction: (() -> ())?
    
    @State var text: String = ""
    
    var body: some View {
        HStack (alignment: .center, spacing: 16) {
            
            if subtitle.type == .streamer {
                
                if let image = subtitle.image {
                    Image(image)
                        .resizable()
                        .frame(width: 264, height: 200)
                }
            }
            
            ZStack {
                Text (subtitle.subtitle)
                    .frame(width: 1255.81, height: 120, alignment: .leading)
                    .font(.custom("PTMono-Regular", size: 29))
                
                if let funcAction = buttonAction {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                funcAction()
                            }, label: {
                                Image("Next")
                            })
                            .buttonStyle(BlankButtonStyle())
                        }
                    }
                    .padding(.bottom, 16)
                    .padding(.trailing, 16)
                }
                
            }
            .frame(width: 1320, height: 200, alignment: .center)
            .background {
                Color(red: 1, green: 1, blue: 1, opacity: 0.1)
            }
            
            if subtitle.type == .villain {
                if let image = subtitle.image {
                    Image(image)
                        .resizable()
                        .frame(width: 264, height: 200)
                }
            }
            
        }
        .onAppear {
            SoundManager.instance.playSoundM4A(sound: subtitle.audio, loops: 0)
        }
    }
}

struct SubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleView(subtitle: MiniGameSubtitles.allMiniGameSubtitles[1].hit!, buttonAction: nil)
    }
}
