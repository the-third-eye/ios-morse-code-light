//
//  MorseLightSettings.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct MorseLightSettingsView: View{
    
    @Environment(\.presentationMode) var presentation

    @ObservedObject var settings: MorseSettings
    @Binding var userInput: String
    
    var body: some View{
        VStack{
            Text("Light Settings")
                .padding(.bottom, 25)
            HStack{
                Text("Speed")
                    .frame(width: 60, alignment: .leading)
                    .font(.system(size: 11))
                Slider(value: $settings.speed, in: 0...20)
            }
            HStack{
                Text("Brightness")
                    .frame(width: 60, alignment: .leading)
                    .font(.system(size: 11))
                Slider(value: $settings.brightness, in: 0...20)
            }
            HStack{
                Spacer()
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                    
                }){
                    Text("Play").font(.system(size: 11))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 15, bottom: 2, trailing: 15))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            Image("logo-vector")
                .frame(maxWidth: .infinity, minHeight: 200)
            Spacer()
        }.padding()
    }
}

struct MorseLightSettings_Previews: PreviewProvider{
    static var previews: some View{
        MorseLightSettingsView(settings: MorseSettings(), userInput: .constant("hello"))
    }
}
