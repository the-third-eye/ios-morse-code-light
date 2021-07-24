//
//  LearnMorseView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/18/21.
//

import Foundation
import SwiftUI

struct LearnInternationalMorseView: View{
    
    let alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    func getWidth(character: Character, scalar: Float) -> Float {
        let width: Float = InternationalMorseStandard.symbolWidth[character]! * scalar
        return width
    }
    
    @ObservedObject
    var settings: MorseSettings
    
    var body: some View{
        

        VStack{
            Text("International Morse")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 15)
            List{
                ForEach(alphabet, id: \.self){character in
                    HStack{
                        Text(String(character).uppercased())
                        Spacer()
                        Image("international-vector/" + String(character))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: CGFloat(getWidth(character: character, scalar: 0.5)), height: 12.5, alignment: .center)
                        Spacer()
                        Button(action:{
                            let morseChar = MorseCharacter(character: character, standard: InternationalMorseStandard())
                            MorseTorch.playCharacter(character: morseChar, settings: settings)
                        }){
                            Image(systemName: "bolt")
                        }
                        .padding(.trailing, 25)
                        Image(systemName: "speaker")
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        .navigationBarTitle("")
        .navigationTitle("")
    }
}

struct LearnInternationalMorseView_Previews: PreviewProvider{
    static var previews: some View{
        LearnInternationalMorseView(settings: MorseSettings())
    }
}

