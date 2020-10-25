//
//  TrackManager.swift
//  ShadowAppleMusic
//
//  Created by 문효재 on 2020/10/25.
//

import Foundation
import AVFoundation

class TrackManager {
    
    var tracks: [AVPlayerItem] = []
    var album: [Album] = []
    var todayTrack: AVPlayerItem?
    
    init(){
        
    }
    
    func loadTrack() -> [AVPlayerItem] {
        return []
    }
    
    func track(at index: Int) -> Track? {
        return nil
    }
    
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        return []
    }
    
    func loadOtherTodaysTrack() {
        
    }
}
