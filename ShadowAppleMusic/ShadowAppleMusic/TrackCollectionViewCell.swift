//
//  TrackCollectionViewCell.swift
//  ShadowAppleMusic
//
//  Created by 문효재 on 2020/10/24.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackThumbnail.layer.cornerRadius = 8
        trackArtist.textColor = UIColor.systemGray2
    }
    
    func updateUI(item: Track?){
        guard let track = item else { return }
        
        self.trackThumbnail.image = track.artwork
        self.trackTitle.text = track.title
        self.trackArtist.text = track.artist
    }
    
}
