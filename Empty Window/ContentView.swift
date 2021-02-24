//
//  ContentView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/22/21.
//

import SwiftUI
import AVFoundation

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

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
