//
//  InternationalMorseStandard.swift
//
//  Created by Carlos McNulty on 3/10/21.
//

import Foundation

struct InternationalMorseStandard: MorseStandard{
    
    private static let symbolsMap : [Character: String] = [
        "a": ".-",
        "b": "-...",
        "c": "-.-.",
        "d": "-..",
        "e": ".",
        "f": "..-.",
        "g": "--.",
        "h": "....",
        "i": "..",
        "j": ".---",
        "k": "-.-",
        "l": ".-..",
        "m": "--",
        "n": "-.",
        "o": "---",
        "p": ".--.",
        "q": "--.-",
        "r": ".-.",
        "s": "...",
        "t": "-",
        "u": "..-",
        "v": "---.",
        "w": ".--",
        "x": "-..-",
        "y": "-.--",
        "z": "--..",
        "0": "-----",
        "1": ".----",
        "2": "..---",
        "3": "...--",
        "4": "....-",
        "5": ".....",
        "6": "-....",
        "7": "--...",
        "8": "---..",
        "9": "----."
    ]
        
    private static let unitsMap : [Character: MorseUnits] = [
        "a": [Token(.SYM, 1), Token(.SYM, 3)],
        "b": [Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "c": [Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 1)],
        "d": [Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 1)],
        "e": [Token(.SYM, 1)],
        "f": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 1)],
        "g": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1)],
        "h": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "i": [Token(.SYM, 1), Token(.SYM, 1)],
        "j": [Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3)],
        "k": [Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 3)],
        "l": [Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 1)],
        "m": [Token(.SYM, 3), Token(.SYM, 3)],
        "n": [Token(.SYM, 3), Token(.SYM, 1)],
        "o": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3)],
        "p": [Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1)],
        "q": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 3)],
        "r": [Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 1)],
        "s": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "t": [Token(.SYM, 3)],
        "u": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 3)],
        "v": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1)],
        "w": [Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 3)],
        "x": [Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 3)],
        "y": [Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 3)],
        "z": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1), Token(.SPACE, 1)],
        "0": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3)],
        "1": [Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3)],
        "2": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3)],
        "3": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 3), Token(.SYM, 3)],
        "4": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 3)],
        "5": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "6": [Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "7": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "8": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 1)],
        "9": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1)]
    ]
    
    func getSymbol(character: Character) -> String{
        return InternationalMorseStandard
            .symbolsMap[character] ?? ""
    }
    
    func getUnits(character: Character) -> MorseUnits{
        return InternationalMorseStandard
            .unitsMap[character] ?? []
    }
    
    func isCharacter(character: Character) -> Bool {
        return InternationalMorseStandard
            .symbolsMap.keys.contains(character)
    }
}
