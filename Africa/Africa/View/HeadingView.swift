//
//  HeadingView.swift
//  Africa
//
//  Created by Ajeet Sharma on 20/04/26.
//

import SwiftUI

struct HeadingView: View {
    
    //MARK: - PROPERTIES
    var headingImage: String
    var headingText: String
    //MARK: - BODY
    
    var body: some View {
        HStack {
            
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
            
        }
        .padding(.vertical)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness is Pictures")
        .padding()
}
