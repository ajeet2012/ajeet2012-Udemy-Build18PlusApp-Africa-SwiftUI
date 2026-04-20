//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Ajeet Sharma on 20/04/26.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    //MARK: - BODY
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link("\(animal.name)", destination: URL(string: animal.link)!)
                }
                .foregroundColor(.accent)
            }// : HSTACK
        }// :BOX
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals:[Animal]  = Bundle.main.decode("animals.json")
    ExternalWebLinkView(animal: animals[0])
        .padding()
}
