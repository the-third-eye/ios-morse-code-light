//
//  MorseTorch2.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

import AVFoundation

struct MorseTorch{
    
    private let text: MorseText
    private let unitSecs: Float = 0.2
    
    init(text: MorseText) {
        self.text = text
    }
    
    
    func toggleTorch(on: Bool, torchLevel: Float){
        guard let device = AVCaptureDevice.default(for: .video) else {return}
        if device.hasTorch{
            do{
                try device.lockForConfiguration()
                if on == true{
                    device.torchMode = .on
                    try device.setTorchModeOn(level: torchLevel)
                }
                else{
                    device.torchMode = .off
                }
            }
            catch{
                print("torch could not be found")
            }
        }
        else{
            print("torch is not available")
        }
    }
    
    func activate(torchLevel: Float, speed: Float = 1.0){
        DispatchQueue.global(qos: .background).async {
            self.activateHelper(torchLevel: torchLevel, speed: speed)
        }
    }
    
    
    private func activateHelper(torchLevel: Float, speed: Float){
        // Time between each word
        let wordSpacer = unitSecs*6/speed
        // Time betwen letters
        let letterSpacer = unitSecs*3/speed
        // Time between morse code units in letter
        let subLetterSpacer = unitSecs/speed
        
        for word in text.getWords(){
            for character in word.getCharacters(){
                for unit in character.getUnits(){
                    // Toggle torch on for length of morse code unit
                    toggleTorch(on: true, torchLevel: torchLevel)
                    Thread.sleep(forTimeInterval: Double(unit))
                    toggleTorch(on: false, torchLevel: torchLevel)
                    Thread.sleep(forTimeInterval: Double(subLetterSpacer))
                }
                Thread.sleep(forTimeInterval: Double(letterSpacer))
            }
            Thread.sleep(forTimeInterval: Double(wordSpacer))
        }
    }
}
