//
//  TextView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/8/21.
//

import SwiftUI

struct TextView: View {
    
    @Binding var userInput: String
    
    var body: some View {
        Text(MorseText(text: userInput).toString())
            .font(.system(size: 24, weight: .light, design: .serif))
            .frame(width: 350, height: 350)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(userInput: .constant("Morse Code"))
    }
}
