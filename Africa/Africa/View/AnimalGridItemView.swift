//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Ajeet Sharma on 22/04/26.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals:[Animal] = Bundle.main.decode("animals.json")
    AnimalGridItemView(animal: animals[0])
        .padding()
}
