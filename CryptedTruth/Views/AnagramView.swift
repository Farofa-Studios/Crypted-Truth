//
//  AnagramView.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 17/02/23.
//

import SwiftUI

struct AnagramView: View {
    
    let rows =
    [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            VStack {
                
                LazyHGrid(rows: rows, spacing: 8) {
                    Button("T") {}
                    Button("S") {}
                    Button("D") {}
                    Button("N") {}
                    Button("S") {}
                    Button("I") {}
                    Button("E") {}
                    Button("O") {}

                }
                
                HStack(spacing: 16) {
                    Button {
                        //
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "delete.left")
                            Text("Desfazer")
                        }
                    }
                    
                    Button {
                        //
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "trash")
                            Text("Apagar")
                        }
                    }

                }
               
            }
        }
    }
}

struct AnagramView_Previews: PreviewProvider {
    static var previews: some View {
        AnagramView()
    }
}
