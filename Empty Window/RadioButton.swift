//
//  RadioButton.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/11/21.
//

import Foundation
import SwiftUI

struct RadioButton: View{
    
    @State var buttonSelected: Bool = true
    
    let id: String
    let callback: (String)->()
    let selectedId: String
    
    init(_ id: String, callback: @escaping (String)->(), selectedId: String) {
        self.id = id
        self.callback = callback
        self.selectedId = selectedId
    }
    
    var body: some View{
        Button(action: {
            self.callback(self.id)
        }){
            HStack(alignment: .center, spacing: 10){
                Image(systemName: self.selectedId == self.id ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                Text(id)
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct RadioButton_Previews: PreviewProvider{
    
    static var previews: some View{
        RadioButton("Light Flashes", callback: self.printMethod, selectedId: "Light Flashes")
    }
    
    static func printMethod(_ id: String){
        print(id)
    }
}
