//
//  PlayerViewViewController.swift
//  ShadowAppleMusic
//
//  Created by 문효재 on 2020/10/26.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var artistLabel : UILabel!
    
    @IBOutlet weak var playerControlButton: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    
    let simplePlayer = SimplePlayer.shared
    
    var timeObserver: Any?
    var isSeeking: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePlayButton()
        updateTime(time: CMTime.zero)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTintColor()
        updateTrackInfo()
    }
    
    func updateTintColor(){
        
    }
    
    func updateTrackInfo(){
        guard let track = simplePlayer.currentItem?.convertToTrack() else {return}
        thumnailImageView.image = track.artwork
        titleLabel.text = track.title
        artistLabel.text = track.artist
    }
    
    
    func updatePlayButton(){
        let configuration = UIImage.SymbolConfiguration(pointSize: 40)

        if simplePlayer.isPlaying {
            let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
            playerControlButton.setImage(image, for: .normal)
            
        } else {
            let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
            playerControlButton.setImage(image, for: .normal)

        }
    }
    
    func updateTime(time: CMTime){
        
    }

    @IBAction func togglePlayButton(_ sender: UIButton){
        if simplePlayer.isPlaying {
            simplePlayer.pause()
        } else {
            simplePlayer.play()
        }
        updatePlayButton()
    }
    
    @IBAction func beginDrag(_ sender: UISlider) {
        isSeeking = true
    }
    
    
    @IBAction func endDrag(_ sender: UISlider) {
        isSeeking = false
    }

}
