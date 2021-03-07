//
//  MyButton.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/26/21.
//

import SwiftUI
import AVFoundation

struct MyButton: View {
    
    @State private var torchOn = false
    @Binding var userInput: String
    
    var body: some View {
        
        Button(action: {
            let morseTorch = MorseTorch(text: MorseText(text: userInput))
            morseTorch.activate(torchLevel: 1.0, speed: 5.0)
            
//            let morseText = MorseText(text: "hello / my . name . is *** carlos ")
//            var words = morseText.getWords()
//            words[0].addCharacter(character: MorseCharacter(character: "t"))
//
//            print("first word")
//            print("starting")
//
//            for character in words[0].getCharacters(){
//                print(character.getChar())
//            }
//
//            print("ending")
//
//            for word in words{
//                var actualWord = ""
//                for character in word.getCharacters(){
//                    actualWord.append(character.getChar())
//                }
//                print(actualWord)
//                actualWord = ""
//            }
            
        }){
            HStack{
                Image("morse-code-3")
                    .clipShape(Rectangle())
                    .shadow(radius: 7)
                Text("Convert")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(.black)
            }
            .padding()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
            .cornerRadius(15)
        }
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton(userInput: .constant("Hi"))
    }
}
