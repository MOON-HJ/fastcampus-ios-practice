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
    @IBOutlet weak var thumnailBlurBackImage: UIImageView!
    
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
        timeObserver = simplePlayer.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 10), queue: DispatchQueue.main, using: {time in
            self.updateTime(time: time)
        } )

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTintColor()
        updateTrackInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        simplePlayer.pause()
        simplePlayer.replaceCurrentItem(with: nil)
    }
    
    func updateTintColor(){
        playerControlButton.tintColor = DefaultStyle.Colors.tint
        timeSlider.tintColor = DefaultStyle.Colors.tint
        
    }
    
    func updateTrackInfo(){
        guard let track = simplePlayer.currentItem?.convertToTrack() else {return}
        thumnailImageView.image = track.artwork
        titleLabel.text = track.title
        artistLabel.text = track.artist
        
        thumnailBlurBackImage.image = track.artwork
        let darkBlur = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = thumnailBlurBackImage.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        thumnailBlurBackImage.addSubview(blurView)

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
        currentTimeLabel.text = secondsToString(sec: simplePlayer.currentTime )
        totalDurationLabel.text = secondsToString(sec: simplePlayer.totalDurationTime)
        
        if isSeeking == false {
            timeSlider.value = Float(simplePlayer.currentTime/simplePlayer.totalDurationTime)
        }
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
    
    @IBAction func seek(_ sender: UISlider) {
        guard let currentItem = simplePlayer.currentItem else { return }
        let position = Double(sender.value)
        let seconds = position * currentItem.duration.seconds
        let time = CMTime(seconds: seconds, preferredTimescale: 100)
        simplePlayer.seek(to: time)
    }

    func secondsToString(sec: Double) -> String {
           guard sec.isNaN == false else { return "00:00" }
           let totalSeconds = Int(sec)
           let min = totalSeconds / 60
           let seconds = totalSeconds % 60
           return String(format: "%02d:%02d", min, seconds)
       }

}
