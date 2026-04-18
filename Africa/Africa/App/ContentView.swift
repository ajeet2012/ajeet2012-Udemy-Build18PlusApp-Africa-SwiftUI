//
//  ContentView.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 ))
            }//: LIST
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode( .large )
        }//: NAVIGATION-VIEW
    }
}

#Preview {
    ContentView()
}
