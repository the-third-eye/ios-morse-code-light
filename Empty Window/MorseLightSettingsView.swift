//
//  MorseLightSettings.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct MorseLightSettingsView: View{
    @Binding var speed: Double
    @Binding var brightness: Double
    
    var body: some View{
        VStack{
            HStack{
                Text("Speed")
                    .frame(width: 60, alignment: .leading)
                    .font(.system(size: 11))
                Slider(value: $speed, in: 0...20)
            }
            HStack{
                Text("Brightness")
                    .frame(width: 60, alignment: .leading)
                    .font(.system(size: 11))
                Slider(value: $brightness, in: 0...20)
            }
            HStack{
                Spacer()
                Button(action: {}){
                    Text("Play").font(.system(size: 11))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 15, bottom: 2, trailing: 15))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
        }.padding()
    }
}

struct MorseLightSettings_Previews: PreviewProvider{
    static var previews: some View{
        MorseLightSettingsView(speed: .constant(1.0), brightness: .constant(1.0))
    }
}
