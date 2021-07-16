//
//  InternationalMorseStandard.swift
//
//  Created by Carlos McNulty on 3/10/21.
//

import Foundation
import SwiftUI

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
    
    private static let imageMap: [Character: Image] = [
        "a": Image("international-morse-images/a"),
        "b": Image("international-morse-images/b"),
        "c": Image("international-morse-images/c"),
        "d": Image("international-morse-images/d"),
        "e": Image("international-morse-images/e"),
        "f": Image("international-morse-images/f"),
        "g": Image("international-morse-images/g"),
        "h": Image("international-morse-images/h"),
        "i": Image("international-morse-images/i"),
        "j": Image("international-morse-images/j"),
        "k": Image("international-morse-images/k"),
        "l": Image("international-morse-images/l"),
        "m": Image("international-morse-images/m"),
        "n": Image("international-morse-images/n"),
        "o": Image("international-morse-images/o"),
        "p": Image("international-morse-images/p"),
        "q": Image("international-morse-images/q"),
        "r": Image("international-morse-images/r"),
        "s": Image("international-morse-images/s"),
        "t": Image("international-morse-images/t"),
        "u": Image("international-morse-images/u"),
        "v": Image("international-morse-images/v"),
        "w": Image("international-morse-images/w"),
        "x": Image("international-morse-images/x"),
        "y": Image("international-morse-images/y"),
        "z": Image("international-morse-images/z"),
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
        "z": [Token(.SYM, 3), Token(.SYM, 3), Token(.SYM, 1), Token(.SYM, 1)],
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
    
    func getImage(character: Character) -> Image{
        return InternationalMorseStandard.imageMap[character] ?? Image("intl-morse-a")
    }
    
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
