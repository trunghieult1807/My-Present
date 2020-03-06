//
//  PlayingScreenViewController.swift
//  My Present
//
//  Created by Apple on 3/1/20.
//  Copyright © 2020 Hieu Le. All rights reserved.
//

import UIKit
import AVFoundation

class PlayingScreenViewController: UIViewController {
    
    //MARK: Setup outlet
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var spotify: UISlider!
    
    @IBOutlet weak var timeElapsedLabel: UILabel!
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var repeatButton: UIButton!
    
    @IBOutlet weak var imageDisplay: UIImageView!
    
    //MARK: Variables
    var favorited: Bool = false
    var player: AVAudioPlayer?
    var timer: Timer?
    var track: Bool = true
    var repeatTrack: Bool = false
    
    //MARK: Display Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayer()
        let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let player = player else { return }
        spotify.value = 0.0
        spotify.maximumValue = Float(player.duration)
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(self.updatespotify), userInfo: nil, repeats: true)
    }
    
    
    //MARK: Actions
    @IBAction func favoriteTapped(_ sender: Any) {
        favorited = !favorited
        if favorited {
            favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "favorite-border"), for: .normal)
        }
    }
    
    
    @IBAction func spotifyValuechanged(_ sender: UISlider) {
        player?.currentTime = Float64(spotify.value)
        player?.play()
        playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
    }
    
    @IBAction func playPausePress(_ sender: Any) {
        guard let player = player else { return }
        if player.isPlaying {
            player.pause()
            playPauseButton.setImage(UIImage(named: "play"), for: .normal)
        } else {
            player.play()
            playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
        }
    }
    
    @IBAction func repeatTapped(_ sender: Any) {
        if repeatTrack {
            repeatButton.setImage(UIImage(named: "repeatt"), for: .normal)
        }
        else {
            repeatButton.setImage(UIImage(named: "repeated"), for: . normal)
        }
        repeatTrack = !repeatTrack
    }
    
    @IBAction func backTapped(_ sender: Any) {
        player?.stop()
    }
    
    
    
    //MARK: Function
    
    @objc func changeImage() {
        let i = Int.random(in: 1..<98)
        imageDisplay.image = UIImage(named: "scene\(i)")
    }
    
    func setupPlayer() {
        guard let url = Bundle.main.url(forResource: "beautiful", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func updatespotify() {
        guard let player = player else { return }
        spotify.value = Float(player.currentTime)
        // Update time remaining label
        let remainingTimeInSeconds = player.duration - player.currentTime
        timeRemainingLabel.text = getFormattedTime(timeInterval: remainingTimeInSeconds)
        timeElapsedLabel.text = getFormattedTime(timeInterval: player.currentTime)
    }
    
    func getFormattedTime(timeInterval: TimeInterval) -> String {
        let mins = timeInterval / 60
        let secs = timeInterval.truncatingRemainder(dividingBy: 60)
        let timeformatter = NumberFormatter()
        timeformatter.minimumIntegerDigits = 2
        timeformatter.minimumFractionDigits = 0
        timeformatter.roundingMode = .down
        guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
            return ""
        }
        return "\(minsStr):\(secsStr)"
    }
    
}

