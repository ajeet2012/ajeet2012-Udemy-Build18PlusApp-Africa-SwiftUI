//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Ajeet Sharma on 21/04/26.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileExtension: String) -> AVPlayer? {
    if let videoURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
        videoPlayer = AVPlayer(url: videoURL)
        videoPlayer?.play()
    }
    return videoPlayer
}
