//
//  QuoteController.swift
//  My Present
//
//  Created by Apple on 2/9/20.
//  Copyright © 2020 Hieu Le. All rights reserved.
//

import UIKit
import AVFoundation
class QuoteController: UIViewController {
    var player: AVAudioPlayer?
    var count: Int = 0
    @IBOutlet weak var nextBtn: UIButton!
    
    
    @IBOutlet weak var img: UIImageView!
    
    //var i: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayer()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let player = player else { return }
        player.play()
        //timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(self.updatespotify), userInfo: nil, repeats: true)
    }
    
    @IBAction func imgControllButton(_ sender: Any) {
        let i = Int.random(in: 1..<320)
        img.image = UIImage.init(named: "img\(i)")
        count += 1
        print(i)
        if count >= 5 {
            nextBtn.alpha = 0.5
        }
    }
    
    
    @IBAction func nextTapped(_ sender: Any) {
        player?.stop()
    }
    
    
    func setupPlayer() {
        guard let url = Bundle.main.url(forResource: "quote", withExtension: "mp3") else { return }
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
}
