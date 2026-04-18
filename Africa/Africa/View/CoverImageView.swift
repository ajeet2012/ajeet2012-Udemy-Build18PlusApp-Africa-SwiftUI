//
//  CoverImageView.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - PROPERTIES
    
    let coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
    //MARK: - BODY
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } // LOOP
        }// TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}
