//
//  InsetFactView.swift
//  Africa
//
//  Created by Ajeet Sharma on 20/04/26.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    //MARK: - BODY
    
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.facts, id: \.self) { item in
                    Text(item)
                }
            }//: TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: BOX
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals:[Animal]  = Bundle.main.decode("animals.json")
    InsetFactView(animal: animals[0])
        .padding()
}
