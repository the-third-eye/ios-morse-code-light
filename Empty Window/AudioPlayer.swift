//
//  AudioPlayer.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/10/21.
//

import Foundation
import AVFoundation

struct AudioPlayer{
    var player : AVAudioPlayer?
    
    mutating func playSound(){
        guard let url = Bundle.main.url(forResource: "beep", withExtension: "wav") else {return}
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else {return}
            print("PLAYING AUDIO")
            player.play()
        }
        catch let error{
            print("CAN'T PLAY AUDIO")
            print(error)
        }
    }
}
