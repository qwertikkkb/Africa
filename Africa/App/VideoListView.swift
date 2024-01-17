//
//  VideoListView.swift
//  Africa
//
//  Created by Nicolai Bodean on 28.11.2023.
//

import SwiftUI

struct VideoListView: View {
   @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                       
                    }
                }//Loop
            }//List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    //Shuffle videos
                    videos.shuffle()
                    hapticImpact.impactOccurred()
                    
                }) {
                    Image(systemName: "arrow.2.squarepath")
                  }
                }
            }
        }//navigation
    }
}

#Preview {
    VideoListView()
}
