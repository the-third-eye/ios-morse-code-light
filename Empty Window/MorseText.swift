//
//  MorseText.swift
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

struct MorseText{
   
    private var words: [MorseWord] = []
    private var standard: MorseStandard
    
    init(text: String, standardType: StandardType = .AmericanMorse) {
        
        standard = MorseStandardCreator.create(standardType: standardType)

        for word in text.split(separator: " "){
            words.append(MorseWord(word: String(word), standard: standard))
        }
    }
    
    func getWords() -> [MorseWord] {
        return words
    }
    
    func getCharacters() -> [MorseCharacter] {
        var characters: [MorseCharacter] = []
        for word in words{
            for character in word.getCharacters(){
                characters.append(character)
            }
        }
        return characters
    }
    
    func getLength() -> Int{
        return words.count
    }
    
    func getStandard() -> MorseStandard{
        return standard
    }
    
    func toString() -> String{
        return words.map{ $0.toString() }.joined(separator: "/")
    }
}
