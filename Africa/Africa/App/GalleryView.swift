//
//  GalleryView.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery View")
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        
        
    }
}

#Preview {
    GalleryView()
}
