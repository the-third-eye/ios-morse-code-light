//
//  MorseStandardPicker.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/13/21.
//

import Foundation
import SwiftUI

struct MorseStandardPicker: View{

    @Binding var selectedStandard: StandardType

    var body: some View{
        Picker("", selection: $selectedStandard){
            Text("American").tag(StandardType.AmericanMorse).font(.title)
            Text("International").tag(StandardType.InternationalMorse)
        }
        .pickerStyle(SegmentedPickerStyle())
     //   .padding()
        
    }
}

struct MorseStandardPicker_Previews: PreviewProvider{
    static var previews: some View{
        MorseStandardPicker(selectedStandard: .constant(.InternationalMorse))
    }
}
