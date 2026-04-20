//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Ajeet Sharma on 20/04/26.
//

import SwiftUI

struct InsetGalleryView: View {
    
    //MARK: - PROPERTIES
    var animal: Animal
    
    //MARK: - BODY
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 12) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }//FOR EACH LOOP
            }//: HSTACK
        }//: SCROLLVIEW
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    InsetGalleryView(animal: animals[0])
        .padding()
}
