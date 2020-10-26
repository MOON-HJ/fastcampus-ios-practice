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
        
    }
    
    func updatePlayButton(){
        
    }
    
    func updateTime(time: CMTime){
        
    }
}
