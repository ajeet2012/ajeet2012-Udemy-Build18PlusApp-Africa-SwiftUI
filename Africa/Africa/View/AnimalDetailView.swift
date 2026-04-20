//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Ajeet Sharma on 20/04/26.
//

import SwiftUI

struct AnimalDetailView: View {
    
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    //MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20){
                
                // HERO IMAGE
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .background(
                        Color.accent
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // HEADLINE
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal, 20)
                
                
                // GALLERY
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness is Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                
                // DESCRIPTION
                                
                // MAP
                
                // LINK
                
            }//:VSTACK
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }//:SCROLL
    }
}

#Preview {
    let animal: [Animal] = Bundle.main.decode("animals.json")
    NavigationView {
        AnimalDetailView(animal: animal[1])
            .padding()
    }
    
}
