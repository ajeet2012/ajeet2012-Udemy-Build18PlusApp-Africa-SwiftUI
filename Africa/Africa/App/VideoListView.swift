//
//  VideoListView.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTIES
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    @State private var isPressed = false
    
    //MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                        .padding(.vertical, 4)
                }//: LOOP
            }//: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(Text("Videos"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        videos.shuffle()
                        isPressed.toggle()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                    .sensoryFeedback(.impact, trigger: isPressed)

                }
            }
        }// :NAVIGATION
    }
}

#Preview {
    VideoListView()
}
