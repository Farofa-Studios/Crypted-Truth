//
//  AnagramView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 17/02/23.
//

import SwiftUI

struct AnagramView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image("anagrama")
                Image("anagrama")
                Image("anagrama")
                Image("anagrama")
                Image("anagrama")
                Image("anagrama")
                Image("anagrama")
                Image("anagrama")
            }
            
            HStack {
                
                Button {
                    //
                } label: {
                    Rectangle()
                        .frame(width: 46, height: 44)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                }
                .buttonStyle(.card)
                Button {
                    //
                } label: {
                    Rectangle()
                        .frame(width: 46, height: 44)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                }
                .buttonStyle(.card)
                Button {
                    //
                } label: {
                    Rectangle()
                        .frame(width: 46, height: 44)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                }
                .buttonStyle(.card)
                Button {
                    //
                } label: {
                    Rectangle()
                        .frame(width: 46, height: 44)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                }
                .buttonStyle(.card)
                Button {
                    //
                } label: {
                    Rectangle()
                        .frame(width: 46, height: 44)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                }
                .buttonStyle(.card)
                Button {
                    //
                } label: {
                    Rectangle()
                        .frame(width: 46, height: 44)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                }
                .buttonStyle(.card)
                Button {
                    //
                } label: {
                    Rectangle()
                        .frame(width: 46, height: 44)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                }
                .buttonStyle(.card)
                Button {
                    //
                } label: {
                    Rectangle()
                        .frame(width: 46, height: 44)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.32, blue: 0.42, alpha: 1.00)))
                }
                .buttonStyle(.card)
            }
            

        }
    }
}

struct AnagramView_Previews: PreviewProvider {
    static var previews: some View {
        AnagramView()
    }
}
