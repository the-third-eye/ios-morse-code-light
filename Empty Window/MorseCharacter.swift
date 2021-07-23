//
//  MorseLetter.swift
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation 
import SwiftUI

struct MorseCharacter{
    
    private var character: Character
    private var standard: MorseStandard
    
    init(character: Character, standard: MorseStandard) {
        self.character = character
        self.standard = standard
    }
    
    func getImage() -> Image{
        return standard.getImage(character: character, scalar: 0.5)
    }
    
    func getSymbolWidth() -> Float{
        return standard.getSymbolWidth(character: character)
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
