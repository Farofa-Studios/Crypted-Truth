//
//  MiniGame3.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import SwiftUI

struct MiniGame3: View {
    
    @StateObject var pieces = ImagesProperties()
    @AppStorage("minigame3") var OK3 = false
    
//    let rows = Array(repeating: GridItem(.flexible(), spacing: -1000), count: 4)
    
    let image1 = "01"
    let image2 = "02"
    let image3 = "03"
    let image4 = "04"
    let image5 = "05"
    let image6 = "06"
    let image7 = "07"
    let image8 = "08"
    let image9 = "09"
    let image10 = "10"
    let image11 = "11"
    let image12 = "12"
    let image13 = "13"
    let image14 = "14"
    let image15 = "15"
    let image16 = "16"
    
    @State var rotation1 = 1
    @State var rotation2 = 3
    @State var rotation3 = 2
    @State var rotation4 = 0
    @State var rotation5 = 3
    @State var rotation6 = 2
    @State var rotation7 = 1
    @State var rotation8 = 0
    @State var rotation9 = 3
    @State var rotation10 = 3
    @State var rotation11 = 2
    @State var rotation12 = 2
    @State var rotation13 = 1
    @State var rotation14 = 1
    @State var rotation15 = 1
    @State var rotation16 = 0
    
    @FocusState private var b1: Bool
    @FocusState private var b2: Bool
    @FocusState private var b3: Bool
    @FocusState private var b4: Bool
    @FocusState private var b5: Bool
    @FocusState private var b6: Bool
    @FocusState private var b7: Bool
    @FocusState private var b8: Bool
    @FocusState private var b9: Bool
    @FocusState private var b10: Bool
    @FocusState private var b11: Bool
    @FocusState private var b12: Bool
    @FocusState private var b13: Bool
    @FocusState private var b14: Bool
    @FocusState private var b15: Bool
    @FocusState private var b16: Bool

    @State var subtitle = Subtitle()
    @State var subtitlesGroup: MiniGameSubtitle = MiniGameSubtitle()
    
    var body: some View {
        ZStack {
            
            Color.backgroundColor
                .ignoresSafeArea()
            NavigationView () { 
                VStack {
                    
                    if rotation1 == 0 && rotation2 == 0 && rotation3 == 0 && rotation4 == 0 && rotation5 == 0 && rotation6 == 0 && rotation7 == 0 && rotation8 == 0 && rotation9 == 0 && rotation10 == 0 && rotation11 == 0 && rotation12 == 0 && rotation13 == 0 && rotation14 == 0 && rotation15 == 0 && rotation16 == 0 {
                        
                        NavigationLink {
                            
                            ChallengeConcludedView(subtitle: subtitlesGroup.completed)
                            
                        } label: {
                            Image("Imagem Completa")
                        }
                        .buttonStyle(BoardButtonStyle())
                        .onAppear() {
                            subtitle = subtitlesGroup.hit!
                            SoundManager.instance.playSoundM4A(sound: subtitle.audio, loops: 0)
                            OK3 = true
                        }
                        
                    } else {
                        
                        VStack(spacing: 32) {
                            
                            HStack (spacing: 32) {
                                
                                Button(action: {
                                    rotation1 = (rotation1 + 1) % 4
                                    
                                }) {
                                    Image(image1)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation1)))
                                .focused($b1)
                                .scaleEffect(b1 ? 1.0 : 0.95)

                                Button(action: {
                                    rotation2 = (rotation2 + 1) % 4
                                    
                                }) {
                                    Image(image2)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation2)))
                                .focused($b2)
                                .scaleEffect(b2 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation3 = (rotation3 + 1) % 4
                                    
                                }) {
                                    Image(image3)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation3)))
                                .focused($b3)
                                .scaleEffect(b3 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation4 = (rotation4 + 1) % 4
                                    
                                }) {
                                    Image(image4)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation4)))
                                .focused($b4)
                                .scaleEffect(b4 ? 1.0 : 0.95)
                            }
                            
                            HStack (spacing: 32) {
                                Button(action: {
                                    rotation5 = (rotation5 + 1) % 4
                                    
                                }) {
                                    Image(image5)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation5)))
                                .focused($b5)
                                .scaleEffect(b5 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation6 = (rotation6 + 1) % 4
                                    
                                }) {
                                    Image(image6)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation6)))
                                .focused($b6)
                                .scaleEffect(b6 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation7 = (rotation7 + 1) % 4
                                    
                                }) {
                                    Image(image7)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation7)))
                                .focused($b7)
                                .scaleEffect(b7 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation8 = (rotation8 + 1) % 4
                                    
                                }) {
                                    Image(image8)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation8)))
                                .focused($b8)
                                .scaleEffect(b8 ? 1.0 : 0.95)
                            }
                            
                            HStack (spacing: 32) {
                                Button(action: {
                                    rotation9 = (rotation9 + 1) % 4
                                    
                                }) {
                                    Image(image9)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation9)))
                                .focused($b9)
                                .scaleEffect(b9 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation10 = (rotation10 + 1) % 4
                                    
                                }) {
                                    Image(image10)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation10)))
                                .focused($b10)
                                .scaleEffect(b10 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation11 = (rotation11 + 1) % 4
                                    
                                }) {
                                    Image(image11)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation11)))
                                .focused($b11)
                                .scaleEffect(b11 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation12 = (rotation12 + 1) % 4
                                    
                                }) {
                                    Image(image12)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation12)))
                                .focused($b12)
                                .scaleEffect(b12 ? 1.0 : 0.95)
                            }
                            
                            HStack (spacing: 32) {
                                
                                Button(action: {
                                    rotation13 = (rotation13 + 1) % 4
                                    
                                }) {
                                    Image(image13)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation13)))
                                .focused($b13)
                                .scaleEffect(b13 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation14 = (rotation14 + 1) % 4
                                    
                                }) {
                                    Image(image14)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation14)))
                                .focused($b14)
                                .scaleEffect(b14 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation15 = (rotation15 + 1) % 4
                                    
                                }) {
                                    Image(image15)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation15)))
                                .focused($b15)
                                .scaleEffect(b15 ? 1.0 : 0.95)
                                
                                Button(action: {
                                    rotation16 = (rotation16 + 1) % 4
                                    
                                }) {
                                    Image(image16)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(BoardButtonStyle())
                                .rotationEffect(.degrees(90 * Double(rotation16)))
                                .focused($b16)
                                .scaleEffect(b16 ? 1.0 : 0.95)
                            }
                        }
                    }
                    
                    SubtitleView(subtitle: subtitle, buttonAction: nil)
                }
            }
        }
        
        .onAppear(){
            subtitlesGroup = MiniGameSubtitles.allMiniGameSubtitles[1]
            subtitle = subtitlesGroup.instructions
            SoundManager.instance.playSoundMP3(sound: subtitle.audio, loops: 0)
        }
    }
}

struct MiniGame3_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame3()
    }
}
