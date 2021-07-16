//
//  RadioButtonGroup.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/11/21.
//

import Foundation
import SwiftUI

struct RadioButtonGroup: View{
    
    @State var selectedId: String = ""
    let items: [String]
    let callback: (String) -> ()
    
    var body: some View{
        VStack{
            ForEach(0..<items.count){ index in
                RadioButton(self.items[index], callback: self.radioCallback, selectedId: self.selectedId)
                    .frame(alignment: .leading)
            }
        }
    }
    
    func radioCallback(id: String){
        selectedId = id
        callback(id)
    }
}

struct RadioButtonGroup_Previews: PreviewProvider{
    static var previews: some View{
        RadioButtonGroup(selectedId: "Light Flashes", items: ["Light Flashes", "Sound Pulses"]){selected in
            print("Selected is: \(selected)")
        }
    }
}
