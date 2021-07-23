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
    private var running = false
    
    init(text: MorseText) {
        self.text = text
    }
    
    
    private static func toggleTorch(on: Bool, torchLevel: Float){
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
    
    static func playCharacter(character: MorseCharacter, brightness: Float = 1.0, speed: Float = 1.0){
        DispatchQueue.global(qos: .background).async {
            self.playCharacterHelper(character: character, brightness: brightness, speed: speed)
        }
    }
    
    static private func playCharacterHelper(character: MorseCharacter, brightness: Float = 1.0, speed: Float = 1.0){
        
        let unitSecs: Float = 0.2
            
        // Time between morse code units in letter
        let subLetterSpacer = Double(unitSecs/speed)
        
        for unit in character.getUnits(){
            if unit.getType() == .SPACE {
                // Torch is off for space length
                Thread.sleep(forTimeInterval:
                                Double(unit.getLength())*subLetterSpacer)
            }
            else if unit.getType() == .SYM{
                // Toggle torch on for length of morse code unit
                toggleTorch(on: true, torchLevel: brightness)
                Thread.sleep(forTimeInterval: Double(unit.getLength())*subLetterSpacer)
                toggleTorch(on: false, torchLevel: brightness)
                Thread.sleep(forTimeInterval: subLetterSpacer)
            }
        }
    }
    
    private func activateHelper(torchLevel: Float, speed: Float){
        // Time between each word
        let wordSpacer = Double(unitSecs*6/speed)
        // Time betwen letters
        let letterSpacer = Double(unitSecs*3/speed)
        // Time between morse code units in letter
        let subLetterSpacer = Double(unitSecs/speed)
        
        for word in text.getWords(){
            for character in word.getCharacters(){
                for unit in character.getUnits(){
                    if unit.getType() == .SPACE {
                        // Torch is off for space length
                        Thread.sleep(forTimeInterval:
                                        Double(unit.getLength())*subLetterSpacer)
                    }
                    else if unit.getType() == .SYM{
                        // Toggle torch on for length of morse code unit
                        MorseTorch.toggleTorch(on: true, torchLevel: torchLevel)
                        Thread.sleep(forTimeInterval: Double(unit.getLength())*subLetterSpacer)
                        MorseTorch.toggleTorch(on: false, torchLevel: torchLevel)
                        Thread.sleep(forTimeInterval: subLetterSpacer)
                    }
                }
                Thread.sleep(forTimeInterval: letterSpacer)
            }
            Thread.sleep(forTimeInterval: wordSpacer)
        }
    }
}
