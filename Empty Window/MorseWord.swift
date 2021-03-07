//
//  MorseWord.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

struct MorseWord{
    
    private var characters: [MorseCharacter] = []
    
    init(){}
    
    init(word: String){
        for letter in MorseUtility.cleanInput(text: word){
            characters.append(MorseCharacter(character: letter))
        }
    }
    
    mutating func addCharacter(character: MorseCharacter){
        characters.append(character)
    }
    
    func getCharacters() -> [MorseCharacter]{
        return characters
    }
    
    func getLength() -> Int{
        return characters.count
    }
}
