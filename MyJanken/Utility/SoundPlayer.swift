//
//  SoundPlayer.swift
//  MyJanken
//
//  Created by sherryfeng on 5/18/26.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    private let countdownData = NSDataAsset(name: "mixkit-countdown")!.data
    private var countdownPlayer: AVAudioPlayer!
    
    private let winData = NSDataAsset(name: "win")!.data
    private var winPlayer: AVAudioPlayer!
    
    override init() {
        do {
            try countdownPlayer = AVAudioPlayer(data: countdownData)
            countdownPlayer.prepareToPlay()
            
            try winPlayer = AVAudioPlayer(data: winData)
            winPlayer.prepareToPlay()
        } catch {
            print("something went wrong")
        }
    }
    
    func countdownPlay() {
        countdownPlayer?.play()
    }
    
    func winPlay() {
        winPlayer?.play()
    }
}
