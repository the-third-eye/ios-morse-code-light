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
    @State var query = ""
    
    var body: some View {

        let binding = Binding<String>(
            get: {self.query},
            set: {self.query = $0; self.textFieldChanged($0)}
        )

        VStack{

            
            MorseCodeGridView(userInput: $userInput)
                .frame(minHeight: 200, maxHeight: 200)
            
//            CircleImage()
//                .padding(.top, 80)
//                .padding(.bottom, 200)
//            VStack {
//
//                MyButton(userInput: $userInput)
//
//                Divider()
            
        
            
            TextField("Please Enter: ", text: $userInput)
                    
//                    .frame(width: 300, height: 80, alignment: .center)
//                    .cornerRadius(20)
//                Divider()
//
//            }
//            .padding()
//
//            Spacer()
        }
        .background(Color.white)
    }
    
    private func textFieldChanged(_ text: String){
        let morseText = MorseText(text: text)
        var actualWords = ""
        for word in morseText.getWords(){
            for character in word.getCharacters(){
                actualWords.append(character.getChar())
            }
            actualWords.append("/")
        }
        print(actualWords)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
