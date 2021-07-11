//
//  MorseLetter.swift
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation 






struct MorseCharacter{
    
    private var character: Character
    private var standard: MorseStandard
    
    init(character: Character, standard: MorseStandard) {
        self.character = character
        self.standard = standard
    }
    
    func getChar() -> Character{
        return character
    }
    
    func getUnits() -> MorseUnits{
        return standard.getUnits(character: character)
    }
    
    func getStandard() -> MorseStandard{
        return standard
    }
    
    func toString() -> String{
        return standard.getSymbol(character: character)
    }
}
