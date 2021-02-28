//
//  MorseTorch.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/26/21.
//

import Foundation
import AVFoundation

class MorseTorch{
    
    private var textUnits: TextUnits
    private let unitSecs: Float = 0.2
    
    init(text: String) {
        let converter = MorseTimeUnitConverter()
        textUnits = converter.convert(text: text)
        print(textUnits)
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
        let wordSpacer = unitSecs*6/speed
        let letterSpacer = unitSecs*3/speed
        let subLetterSpacer = unitSecs/speed
        for wordUnits in textUnits{
            for letterUnits in wordUnits{
                for letterUnit in letterUnits{
                    toggleTorch(on: true, torchLevel: torchLevel)
                    Thread.sleep(forTimeInterval: Double(letterUnit))
                    toggleTorch(on: false, torchLevel: torchLevel)
                    Thread.sleep(forTimeInterval: Double(subLetterSpacer))
                }
                Thread.sleep(forTimeInterval: Double(letterSpacer))
            }
            Thread.sleep(forTimeInterval: Double(wordSpacer))
        }
    }
}
