//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Ajeet Sharma on 21/04/26.
//

import SwiftUI
import AVKit
struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    
    var videoSelected: String
    var videoTitle: String
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileExtension: "mp4")){
               // Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                ,
                alignment: .topLeading
            )
        }//: VSTACK
        .accentColor(Color.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    NavigationView {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
    
}
