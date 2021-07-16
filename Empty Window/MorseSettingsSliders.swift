//
//  MorseSettingsSliders.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/11/21.
//

import Foundation
import SwiftUI


struct MorseSettingsSlider: View{
    
    @Binding var speed: Double
    @Binding var intensity: Double
    
    var body: some View{
        VStack{
            HStack{
                Text("Speed")
                    .frame(width: 50, alignment: .leading)
                    .font(.system(size: 11))
                Slider(value: $speed, in: 0...20)
            }
            HStack{
                Text("Intensity")
                    .frame(width: 50, alignment: .leading)
                    .font(.system(size: 11))
                Slider(value: $intensity, in: 0...20)
            }
        }.padding()
    }
}

struct MorseSettingsSlider_Previews: PreviewProvider{
    static var previews: some View{
        MorseSettingsSlider(speed: .constant(1.0), intensity: .constant(1.0))
    }
}
