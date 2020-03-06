//
//  PlayingScreenViewController.swift
//  My Present
//
//  Created by Apple on 3/1/20.
//  Copyright © 2020 Hieu Le. All rights reserved.
//

import UIKit
import AVFoundation
class FirstViewController: UIViewController, UITabBarControllerDelegate {
    var player: AVAudioPlayer?

    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var tabBar: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.isHidden = true
        setupPlayer()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           guard let player = player else { return }
           player.play()
        tabBarController?.delegate = self
           //timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(self.updatespotify), userInfo: nil, repeats: true)
       }
    
    @IBAction func nextTapped(_ sender: Any) {
        player?.stop()
    }
    

    
    
    @IBAction func buttonPressed(_ sender: Any) {
        button.isHidden = true
        textField.isHidden = false
        textField.setTextWithTypeAnimation(typedText: "I'M SHY TO SPEAK ABOUT LOVE, BUT I JUST WANT TO TELL YOU THAT TO BE LOVED BY YOU IS MY JOY, YOUR DREAM IS MY LIFE AND MY DREAM IS TO BE WITH YOU ETERNALLY!!!", characterDelay: 13)
                DispatchQueue.main.asyncAfter(deadline: .now() + 21) {
            // your code here
            self.nextBtn.alpha = 0.5
        }
        
    }
    
    
    
    func setupPlayer() {
        guard let url = Bundle.main.url(forResource: "intro", withExtension: "mp3") else { return }
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
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        player?.stop()
    }
}


extension UILabel {
    func setTextWithTypeAnimation(typedText: String, characterDelay: TimeInterval = 5.0) {
        text = ""
        var writingTask: DispatchWorkItem?
        writingTask = DispatchWorkItem { [weak weakSelf = self] in
            for character in typedText {
                DispatchQueue.main.async {
                    weakSelf?.text!.append(character)
                }
                Thread.sleep(forTimeInterval: characterDelay/100)
            }
        }
        
        if let task = writingTask {
            let queue = DispatchQueue(label: "typespeed", qos: DispatchQoS.userInteractive)
            queue.asyncAfter(deadline: .now() + 0.05, execute: task)
        }
    }
    
}




