//
//  MiniGame3.swift
//  CryptedTruth
//
//  Created by Victor Santos on 2/15/23.
//

import SwiftUI

struct MiniGame3: View {
    
    @StateObject var pieces = ImagesProperties()
    @AppStorage("minigame2") var OK2 = false
    
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
    let image13 = "12"
    let image14 = "13"
    let image15 = "14"
    let image16 = "15"
    
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
    
    var body: some View {
        ZStack {
            
            Color.backgroundColor
                .ignoresSafeArea()
            NavigationView(){
                VStack {
                    
                    if rotation1 == 0 && rotation2 == 0 && rotation3 == 0 && rotation4 == 0 && rotation5 == 0 && rotation6 == 0 && rotation7 == 0 && rotation8 == 0 && rotation9 == 0 && rotation10 == 0 && rotation11 == 0 && rotation12 == 0 && rotation13 == 0 && rotation14 == 0 && rotation14 == 0 && rotation15 == 0 && rotation16 == 0 {
                        
                        
                        NavigationLink {
                            
                            BoardView()
                            
                        } label: {
                            Button(action: {
                                
                                OK2 = true
                                
                            }) {
                                Image("Imagem Completa")
                                
                            }
                            .buttonStyle(BoardButtonStyle())
                        }
                        .buttonStyle(BoardButtonStyle())
                    } else {
                        
                        VStack() {
                            
                            HStack{
                                
                                Button(action: {
                                    rotation1 = (rotation1 + 1) % 4
                                    
                                }) {
                                    Image(image1)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation1)))
                                
                                
                                Button(action: {
                                    rotation2 = (rotation2 + 1) % 4
                                    
                                }) {
                                    Image(image2)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation2)))
                                
                                
                                Button(action: {
                                    rotation3 = (rotation3 + 1) % 4
                                    
                                }) {
                                    Image(image3)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation3)))
                                
                                Button(action: {
                                    rotation4 = (rotation4 + 1) % 4
                                    
                                }) {
                                    Image(image4)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation4)))
                            }
                            
                            HStack {
                                Button(action: {
                                    rotation5 = (rotation5 + 1) % 4
                                    
                                }) {
                                    Image(image5)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation5)))
                                
                                Button(action: {
                                    rotation6 = (rotation6 + 1) % 4
                                    
                                }) {
                                    Image(image6)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation6)))
                                
                                Button(action: {
                                    rotation7 = (rotation7 + 1) % 4
                                    
                                }) {
                                    Image(image7)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation7)))
                                
                                Button(action: {
                                    rotation8 = (rotation8 + 1) % 4
                                    
                                }) {
                                    Image(image8)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation8)))
                                
                            }
                            
                            HStack {
                                Button(action: {
                                    rotation9 = (rotation9 + 1) % 4
                                    
                                }) {
                                    Image(image9)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation9)))
                                
                                Button(action: {
                                    rotation10 = (rotation10 + 1) % 4
                                    
                                }) {
                                    Image(image10)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation10)))
                                
                                Button(action: {
                                    rotation11 = (rotation11 + 1) % 4
                                    
                                }) {
                                    Image(image11)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation11)))
                                
                                Button(action: {
                                    rotation12 = (rotation12 + 1) % 4
                                    
                                }) {
                                    Image(image12)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation12)))
                            }
                            
                            HStack {
                                
                                Button(action: {
                                    rotation13 = (rotation13 + 1) % 4
                                    
                                }) {
                                    Image(image13)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation13)))
                                
                                Button(action: {
                                    rotation14 = (rotation14 + 1) % 4
                                    
                                }) {
                                    Image(image14)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation14)))
                                
                                Button(action: {
                                    rotation15 = (rotation15 + 1) % 4
                                    
                                }) {
                                    Image(image15)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation15)))
                                
                                Button(action: {
                                    rotation16 = (rotation16 + 1) % 4
                                    
                                }) {
                                    Image(image16)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                }
                                .buttonStyle(.card)
                                .rotationEffect(.degrees(90 * Double(rotation16)))
                            }
                        }
                    }
                    
                    SubtitleView(subtitle: Subtitle(id: 30, image: "Bot", type: .villain, subtitle: "Deslize entre as peças e clique para rotacionar até formar a imagem completa.", audio: ""), buttonAction: nil)
                }
            }
        }
    }
}

struct MiniGame3_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame3()
    }
}
