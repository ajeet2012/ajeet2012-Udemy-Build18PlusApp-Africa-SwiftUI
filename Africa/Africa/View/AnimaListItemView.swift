//
//  AnimaListItemView.swift
//  Africa
//
//  Created by Ajeet Sharma on 20/04/26.
//

import SwiftUI

struct AnimaListItemView: View {
    
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    //MARK: - BODY
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8) {
                
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                
            }
            
        }//:HSTACK
    }
}

#Preview(traits: .sizeThatFitsLayout) {

    let animals: [Animal] = Bundle.main.decode("animals.json")
    AnimaListItemView(animal: animals[1])
        .padding()
}
