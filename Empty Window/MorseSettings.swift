//
//  MorseSettings.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/13/21.
//

import Foundation
import SwiftUI

struct MorseSettings: View{
    
    @Binding var speed: Double
    @Binding var intensity: Double
    @Binding var selectedMorseType: MorseType
    @Binding var selectedStandard: StandardType
    
    var body: some View{
        HStack{
            MorseSettingsSlider(speed: $speed, intensity: $intensity)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 2)
                )
            VStack{
                MorseTypePicker(selectedMorseType: $selectedMorseType)
                    .padding([.leading, .trailing])
                MorseStandardPicker(selectedStandard: $selectedStandard)
                    .padding([.leading, .trailing])
            }
            .frame(maxWidth: .infinity, minHeight: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 2)
            )
            
            
        }.padding([.top, .bottom])
    }
}

struct MorseSettings_Previews: PreviewProvider{
    static var previews: some View{
        MorseSettings(speed: .constant(1), intensity: .constant(1), selectedMorseType: .constant(.Lights), selectedStandard: .constant(.InternationalMorse))
    }
}
