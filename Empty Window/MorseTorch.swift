//
//  MorseTorch2.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

import AVFoundation

struct MorseTorch{
        
    static private let UNIT_SECS: Float     = 0.2
    static private let WORD_SPACER: Float   = UNIT_SECS*6.0
    static private let LETTER_SPACER: Float = UNIT_SECS*3.0
    
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
    
    static func playText(text: MorseText, settings: MorseSettings, gridState: MorseGridState){
        DispatchQueue.global(qos: .background).async {
            playTextHelper(text: text, settings: settings, gridState: gridState)
        }
    }
    
    static func playCharacter(character: MorseCharacter, settings: MorseSettings){
        DispatchQueue.global(qos: .background).async {
            playCharacterHelper(character: character, settings: settings)
        }
    }
    
    static private func playCharacterHelper(character: MorseCharacter, settings: MorseSettings){
                    
        // Time between morse code units in letter
        let subLetterSpacer = Double(UNIT_SECS/settings.speed)
        
        for unit in character.getUnits(){
            if unit.getType() == .SPACE {
                // Torch is off for space length
                Thread.sleep(forTimeInterval:
                                Double(unit.getLength())*subLetterSpacer)
            }
            else if unit.getType() == .SYM{
                // Toggle torch on for length of morse code unit
                toggleTorch(on: true, torchLevel: settings.brightness)
                Thread.sleep(forTimeInterval: Double(unit.getLength())*subLetterSpacer)
                toggleTorch(on: false, torchLevel: settings.brightness)
                Thread.sleep(forTimeInterval: subLetterSpacer)
            }
        }
    }
    
    static private func playTextHelper(text: MorseText, settings: MorseSettings, gridState: MorseGridState){
        
        DispatchQueue.main.sync {
            gridState.start(text.getCharacters())
        }
        
        // Time between each word
        let wordSpacer = Double(WORD_SPACER/settings.speed)
        // Time betwen letters
        let letterSpacer = Double(LETTER_SPACER/settings.speed)
        
        var pos = 0
        let words = text.getWords()
        
        for i in 0..<words.count{
            let characters = words[i].getCharacters()
            for j in 0..<characters.count{
                
                DispatchQueue.main.sync {
                    gridState.setOn(pos)
                }
                playCharacterHelper(character: characters[j], settings: settings)
                
                DispatchQueue.main.sync {
                    gridState.setOff()
                }
                // Last character doesn't need spacing at the end, word spacing is used
                if j < characters.count-1{
                    Thread.sleep(forTimeInterval: letterSpacer)
                }
                pos += 1
            }
            // Last word doesn't need spacing at the end
            if i < words.count-1{
                Thread.sleep(forTimeInterval: wordSpacer)
            }
        }
        
        DispatchQueue.main.sync {
            gridState.stop()
        }
    }
}
