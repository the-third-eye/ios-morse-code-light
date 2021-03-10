//
//  InternationalMorseStandard.swift
//  Empty Window
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
        "a": [1, 3],
        "b": [3, 1, 1, 1],
        "c": [3, 1, 3, 1],
        "d": [3, 1, 1],
        "e": [1],
        "f": [1, 1, 3, 1],
        "g": [3, 3, 1],
        "h": [1, 1, 1, 1],
        "i": [1, 1],
        "j": [1, 3, 3, 3],
        "k": [3, 1, 3],
        "l": [1, 3, 1, 1],
        "m": [3, 3],
        "n": [3, 1],
        "o": [3, 3, 3],
        "p": [1, 3, 3, 1],
        "q": [3, 3, 1, 3],
        "r": [1, 3, 1],
        "s": [1, 1, 1],
        "t": [3],
        "u": [1, 1, 3],
        "v": [3, 3, 3, 1],
        "w": [1, 3, 3],
        "x": [3, 1, 1, 3],
        "y": [3, 1, 3, 3],
        "z": [3, 3, 1, 1],
        "0": [3, 3, 3, 3, 3],
        "1": [1, 3, 3, 3, 3],
        "2": [1, 1, 3, 3, 3],
        "3": [1, 1, 1, 3, 3],
        "4": [1, 1, 1, 1, 3],
        "5": [1, 1, 1, 1, 1],
        "6": [3, 1, 1, 1, 1],
        "7": [3, 3, 1, 1, 1],
        "8": [3, 3, 3, 1, 1],
        "9": [3, 3, 3, 3, 1]
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
