//
//  ContentView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/22/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var userInput: String = ""
    @State var speed: Double = 10.0
    @State var intensity: Double = 10.0
    @State var selectedMorseType: MorseType = .Lights
    @State var selectedStandard: StandardType = .InternationalMorse
    
    var body: some View {

        VStack{
            Text("Morse Code")
                .font(Font.title.weight(.bold))
                .padding(.bottom)
            MorseCodeGridView(userInput: $userInput, selectedStandard: $selectedStandard)
                .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 2)
                )
            MorseSettings(speed: $speed, intensity: $intensity, selectedMorseType: $selectedMorseType, selectedStandard: $selectedStandard)
  
            MorseTextEditor(placeholder: "Start Typing...", userInput: $userInput)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black,  lineWidth: 2)
                )
            Button("Activate", action: {
                print(userInput, speed, intensity, selectedMorseType)
                let morseTorch = MorseTorch(text: MorseText(text: userInput))
                morseTorch.activate(torchLevel: 1.0)
            })
            .frame(minWidth: 0, maxWidth: 100, maxHeight: 10)
            .font(.system(size: 14))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 2)
            )
            .foregroundColor(.black)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }.padding([.leading, .trailing])
        .background(Color.white)
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
