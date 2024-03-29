//
//  MorseSoundSettingsView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct MorseSoundSettingsView: View{
    
    @Environment(\.presentationMode) var presentation
    
    @Binding var speed: Double
    @Binding var volume: Double
    
    var body: some View{
        VStack{
            Text("Sound Settings")
                .padding(.bottom, 25)
            HStack{
                Text("Speed")
                    .frame(width: 60, alignment: .leading)
                    .font(.system(size: 11))
                Slider(value: $speed, in: 0...20)
            }
            HStack{
                Text("Volume")
                    .frame(width: 60, alignment: .leading)
                    .font(.system(size: 11))
                Slider(value: $volume, in: 0...20)
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

struct MorseSoundSettings_Previews: PreviewProvider{
    static var previews: some View{
        MorseSoundSettingsView(speed: .constant(1.0), volume: .constant(1.0))
    }
}
