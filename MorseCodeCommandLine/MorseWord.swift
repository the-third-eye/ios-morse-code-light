//
//  MorseWord.swift
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

struct MorseWord{
    
    private var characters: [MorseCharacter] = []
    private var standard: MorseStandard
    
    init(word: String, standard: MorseStandard){
        
        self.standard = standard
        
        for letter in MorseUtility.cleanInput(text: word, standard: standard){
            characters.append(MorseCharacter(character: letter, standard: standard))
        }
    }
    
    func getCharacters() -> [MorseCharacter]{
        return characters
    }
    
    func getLength() -> Int{
        return characters.count
    }
    
    func getStandard() -> MorseStandard{
        return standard
    }
    
    func toString() -> String{
        return characters.map{ $0.toString() }.joined(separator: " ")
    }
}
