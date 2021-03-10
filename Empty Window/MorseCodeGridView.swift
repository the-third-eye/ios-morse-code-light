//
//  MorseCodeGridView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import SwiftUI

struct MorseCodeGridView: View {
    
    let data = (1...1000).map{ "Item \($0)" }
    
    @Binding var userInput: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(data, id: \.self){ (text) in
                    let morseText = MorseText(text: userInput)
                    let count = morseText.getLength()
                    Text(String(count))
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MorseCodeGridView_Previews: PreviewProvider {
    static var previews: some View {
        MorseCodeGridView(userInput: .constant("hello"))
    }
}
