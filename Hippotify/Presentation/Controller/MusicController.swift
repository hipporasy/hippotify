//
//  MusicController.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/4/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import UIKit
import AVFoundation

class MusicController : UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var slider: HippotifySlider!
    
    private var _isPlaying: Bool = false {
        didSet {
            _isPlaying ? playButton.setImage(#imageLiteral(resourceName: "ic_pause"), for: .normal) : playButton.setImage(#imageLiteral(resourceName: "ic_play"), for: .normal)
        }
    }
    
    private var _musicPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSong()
    }
    
    private func prepareSong() {
        do {
            _musicPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Falling", ofType: "mp3")!))
            _musicPlayer.prepareToPlay()
            endTimeLabel.text = _musicPlayer.duration.string
            startTimeLabel.text = TimeInterval(0).string
            slider.maximumValue = Float(NSInteger(_musicPlayer.duration))
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            } catch let error {
                print(error)
            }
        }
    }
    
    @objc
    private func trackAudio() {
        slider.value = Float(NSInteger(_musicPlayer.currentTime))
        startTimeLabel.text = _musicPlayer.currentTime.string
    }
    
    @IBAction
    private func onMusicDurationChanged(_ sender: Any) {
        startTimeLabel.text = _musicPlayer.currentTime.string
    }
    
    @IBAction
    private func actionPlay(_ sender: Any) {
        _isPlaying = !_isPlaying
        if _isPlaying {
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(trackAudio), userInfo: nil, repeats: true)
            _musicPlayer.play()
            return
        }
        _musicPlayer.pause()
    }
    
}

private extension TimeInterval {
    
    var string: String {
        
        let time = NSInteger(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        
        return String(format: "%d:%0.2d", minutes, seconds)
        
    }
}

