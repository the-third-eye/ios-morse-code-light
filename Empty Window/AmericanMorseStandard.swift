//
//  AmericanMorseStandard.swift
//
//  Created by Carlos McNulty on 3/11/21.
//

import Foundation
import SwiftUI

struct AmericanMorseStandard: MorseStandard{
    
    private static let symbolsMap : [Character: String] = [
        "a": ".-",
        "b": "-...",
        "c": ".. .",
        "d": "-..",
        "e": ".",
        "f": ".-.",
        "g": "--.",
        "h": "....",
        "i": "..",
        "j": "-.-.",
        "k": "-.-",
        "l": "–",
        "m": "--",
        "n": "-.",
        "o": ". .",
        "p": ".....",
        "q": "..-.",
        "r": ". ..",
        "s": "...",
        "t": "-",
        "u": "..-",
        "v": "...-",
        "w": ".--",
        "x": ".-..",
        "y": ".. ..",
        "z": "... .",
        "0": "—",
        "1": ".--.",
        "2": "..-..",
        "3": "...-.",
        "4": "....-",
        "5": "---",
        "6": "......",
        "7": "--..",
        "8": "-....",
        "9": "-..-"
    ]
    
    private static let imageMap: [Character: Image] = [
        "a": Image("american-morse-images/a"),
        "b": Image("american-morse-images/b"),
        "c": Image("american-morse-images/c"),
        "d": Image("american-morse-images/d"),
        "e": Image("american-morse-images/e"),
        "f": Image("american-morse-images/f"),
        "g": Image("american-morse-images/g"),
        "h": Image("american-morse-images/h"),
        "i": Image("american-morse-images/i"),
        "j": Image("american-morse-images/j"),
        "k": Image("american-morse-images/k"),
        "l": Image("american-morse-images/l"),
        "m": Image("american-morse-images/m"),
        "n": Image("american-morse-images/n"),
        "o": Image("american-morse-images/o"),
        "p": Image("american-morse-images/p"),
        "q": Image("american-morse-images/q"),
        "r": Image("american-morse-images/r"),
        "s": Image("american-morse-images/s"),
        "t": Image("american-morse-images/t"),
        "u": Image("american-morse-images/u"),
        "v": Image("american-morse-images/v"),
        "w": Image("american-morse-images/w"),
        "x": Image("american-morse-images/x"),
        "y": Image("american-morse-images/y"),
        "z": Image("american-morse-images/z"),
    ]
    
    private static let unitsMap : [Character: MorseUnits] = [
        "a": [Token(.SYM, 1), Token(.SYM, 2)],
        "b": [Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "c": [Token(.SYM, 1), Token(.SYM, 1), Token(.SPACE, 1), Token(.SYM, 1)],
        "d": [Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 1)],
        "e": [Token(.SYM, 1)],
        "f": [Token(.SYM, 1), Token(.SYM, 2), Token(.SYM, 1)],
        "g": [Token(.SYM, 2), Token(.SYM, 2), Token(.SYM, 1)],
        "h": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "i": [Token(.SYM, 1), Token(.SYM, 1)],
        "j": [Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 2), Token(.SYM, 1)],
        "k": [Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 2)],
        "l": [Token(.SYM, 4)],
        "m": [Token(.SYM, 2), Token(.SYM, 2)],
        "n": [Token(.SYM, 2), Token(.SYM, 1)],
        "o": [Token(.SYM, 1), Token(.SPACE, 2), Token(.SYM, 1)],
        "p": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "q": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 2), Token(.SYM, 1)],
        "r": [Token(.SYM, 1), Token(.SPACE, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "s": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "t": [Token(.SYM, 2)],
        "u": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 2)],
        "v": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 2)],
        "w": [Token(.SYM, 1), Token(.SYM, 2), Token(.SYM, 2)],
        "x": [Token(.SYM, 1), Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 1)],
        "y": [Token(.SYM, 1), Token(.SYM, 1), Token(.SPACE, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "z": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SPACE, 1), Token(.SYM, 1)],
        "0": [Token(.SYM, 5)],
        "1": [Token(.SYM, 1), Token(.SYM, 2), Token(.SYM, 2), Token(.SYM, 1)],
        "2": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 1)],
        "3": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 2), Token(.SYM, 1)],
        "4": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 2)],
        "5": [Token(.SYM, 2), Token(.SYM, 2), Token(.SYM, 2)],
        "6": [Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "7": [Token(.SYM, 2), Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 1)],
        "8": [Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 1)],
        "9": [Token(.SYM, 2), Token(.SYM, 1), Token(.SYM, 1), Token(.SYM, 2)]
    ]
    
    func getImage(character: Character) -> Image {
        return AmericanMorseStandard.imageMap[character] ?? Image("american-morse-images/a")
    }
    
    func getSymbol(character: Character) -> String{
        return AmericanMorseStandard
            .symbolsMap[character] ?? ""
    }
    
    func getUnits(character: Character) -> MorseUnits{
        return AmericanMorseStandard
            .unitsMap[character] ?? []
    }
    
    func isCharacter(character: Character) -> Bool {
        return AmericanMorseStandard
            .symbolsMap.keys.contains(character)
    }
}
