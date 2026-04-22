//
//  MainView.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.circle")
                    Text("Watch")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }//: TABVIEW
        .tabViewStyle(.tabBarOnly) // Allows switching between sidebar & tab bar

    }
}

#Preview {
    MainView()
}
