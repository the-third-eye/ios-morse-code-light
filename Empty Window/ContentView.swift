//
//  ContentView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/22/21.
//

import SwiftUI
import AVFoundation



struct ContentView: View {
    
    @State var userInput: String = ""
    
    var body: some View {

        VStack{
//            MorseCodeGridView(userInput: $userInput)
//                .frame(minHeight: 200, maxHeight: 200)
            TextView(userInput: $userInput)
            TextField("Please Enter: ", text: $userInput)
        }
        .background(Color.white)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
