//
//  MorseSettingsButtons.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/11/21.
//

import Foundation
import SwiftUI

enum MorseType {
    case Lights
    case Sounds
}

struct MorseTypePicker: View{
    
   @Binding var selectedMorseType: MorseType
    
    init(selectedMorseType: Binding<MorseType> = .constant(.Lights)) {
        let font = UIFont.systemFont(ofSize: 11)
        UISegmentedControl.appearance().setTitleTextAttributes([.font: font], for: .normal)
        _selectedMorseType = selectedMorseType
    }
    
    var body: some View{
        Picker("", selection: $selectedMorseType){
            Text("Lights").tag(MorseType.Lights)
            Text("Sounds").tag(MorseType.Sounds)
        }
        .pickerStyle(SegmentedPickerStyle())
     //   .padding()
    }
}

struct MorseTypePicker_Previews: PreviewProvider{
    
    static var previews: some View{
        MorseTypePicker()
    }
}
