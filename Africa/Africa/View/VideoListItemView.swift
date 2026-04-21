//
//  VideoListItem.swift
//  Africa
//
//  Created by Ajeet Sharma on 21/04/26.
//

import SwiftUI

struct VideoListItemView: View {
    
    //MARK: - PROPERTIES
    
    let video: Video
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZSTACK
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accent)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
            }
        }//: HSTACK
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let videos: [Video] = Bundle.main.decode("videos.json")
    VideoListItemView(video: videos[0])
        .padding()
}
