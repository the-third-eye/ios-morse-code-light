//
//  MorseTorch.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/26/21.
//

import Foundation
import AVFoundation

class MorseTorch{
    
    private var textUnits: [[[Int]]]
    private let unitSecs = 0.2
    
    init(text: String) {
        let converter = MorseTimeUnitConverter()
        textUnits = converter.convert(text: text)
        print(textUnits)
    }
    
    func toggleTorch(on: Bool){
        guard let device = AVCaptureDevice.default(for: .video) else {return}
        if device.hasTorch{
            do{
                try device.lockForConfiguration()
                if on == true{
                    device.torchMode = .on
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
    
    func activate(){
        DispatchQueue.global(qos: .background).async {
            self.activateHelper()
        }
    }
    
    
    @objc func activateHelper(){
        let wordSpacer = unitSecs*6
        let letterSpacer = unitSecs*3
        let subLetterSpacer = unitSecs
        for wordUnits in textUnits{
            for letterUnits in wordUnits{
                for letterUnit in letterUnits{
                    toggleTorch(on: true)
                    Thread.sleep(forTimeInterval: Double(letterUnit))
                    toggleTorch(on: false)
                    Thread.sleep(forTimeInterval: Double(subLetterSpacer))
                }
                Thread.sleep(forTimeInterval: Double(letterSpacer))
            }
            Thread.sleep(forTimeInterval: Double(wordSpacer))
        }
    }
}
