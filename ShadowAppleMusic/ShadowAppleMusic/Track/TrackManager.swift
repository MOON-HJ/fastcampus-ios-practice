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
        let tracks = loadTrack()
        self.tracks = tracks
        self.todayTrack = self.tracks.randomElement()
    }
    
    func loadTrack() -> [AVPlayerItem] {
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        
        return urls.map { AVPlayerItem(url: $0)}
    }
    
    func track(at index: Int) -> Track? {
        
        return tracks[index].convertToTrack()
    }
    
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList:[Track] = tracks.compactMap{$0.convertToTrack()}
        let albumDics = Dictionary(grouping: trackList, by: { (track) in track.albumName})
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album  = Album(title: title, tracks:  tracks)
            albums.append(album)
        }
        
        return []
    }
    
    func loadOtherTodaysTrack() {
        self.todayTrack = self.tracks.randomElement()
        
    }
}
