//
//  MorseLetter.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

typealias MorseUnits = [Int]

struct MorseCharacter{
    
    private var character: Character
    private static var standard: MorseStandard = AmericanMorseStandard()
    
    static func isMorseChar(character: Character) -> Bool{
        return standard.isCharacter(character: character)
    }
    
    init(character: Character) {
        self.character = character
    }
    
    func getChar() -> Character{
        return character
    }
    
    func getUnits() -> MorseUnits{
        return MorseCharacter
            .standard.getUnits(character: character)
    }
    
    static func getStandard() -> MorseStandard{
        return standard
    }
    
    static func setStandard(standard: MorseStandard){
        MorseCharacter.standard = standard
    }
    
    func toString() -> String{
        return MorseCharacter
            .standard.getSymbol(character: character)
    }
}
