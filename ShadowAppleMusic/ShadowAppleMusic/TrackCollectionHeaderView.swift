//
//  TrackCollectionHeaderView.swift
//  ShadowAppleMusic
//
//  Created by 문효재 on 2020/10/26.
//

import UIKit
import AVFoundation

class TrackCollectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: AVPlayerItem?
    var tapHandler: ((AVPlayerItem) -> Void)?
    
    override func awakeFromNib() {
        superview?.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 8
        
    }
    
    func update(with item: AVPlayerItem) {
        self.item = item
        guard let track = item.convertToTrack() else {return}
        
        self.thumbnailImageView.image = track.artwork
        self.descriptionLabel.text = "Today's pick is \(track.artist)'s album - \(track.albumName), Let listion."

    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        guard let todaysItem = item else {return}
        tapHandler?(todaysItem)
    }
}
