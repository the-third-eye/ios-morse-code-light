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
    
    private static let symbolMap: [String: Image] = [
        "dot": Image("dot"),
        "short-dash": Image("short-dash")
    ]
    
    private static let imageMap: [Character: Image] = [
        "a": Image("american-vector/a"),
        "b": Image("american-vector/b"),
        "c": Image("american-vector/c"),
        "d": Image("american-vector/d"),
        "e": Image("american-vector/e"),
        "f": Image("american-vector/f"),
        "g": Image("american-vector/g"),
        "h": Image("american-vector/h"),
        "i": Image("american-vector/i"),
        "j": Image("american-vector/j"),
        "k": Image("american-vector/k"),
        "l": Image("american-vector/l"),
        "m": Image("american-vector/m"),
        "n": Image("american-vector/n"),
        "o": Image("american-vector/o"),
        "p": Image("american-vector/p"),
        "q": Image("american-vector/q"),
        "r": Image("american-vector/r"),
        "s": Image("american-vector/s"),
        "t": Image("american-vector/t"),
        "u": Image("american-vector/u"),
        "v": Image("american-vector/v"),
        "w": Image("american-vector/w"),
        "x": Image("american-vector/x"),
        "y": Image("american-vector/y"),
        "z": Image("american-vector/z"),
    ]
    
    public static let symbolWidth: [Character: Float] = [
        "a": 85,
        "b": 155,
        "c": 105,
        "d": 120,
        "e": 25.0,
        "f": 120,
        "g": 145,
        "h": 130,
        "i": 60,
        "j": 180,
        "k": 145,
        "l": 100,
        "m": 110,
        "n": 85,
        "o": 90,
        "p": 165,
        "q": 155,
        "r": 105,
        "s": 95,
        "t": 50,
        "u": 120,
        "v": 155,
        "w": 145,
        "x": 155,
        "y": 140,
        "z": 140
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
    
    func getImage(character: Character, scalar: Float = 1.0) -> Image {
        return AmericanMorseStandard.imageMap[character] ?? Image("american-morse-images/a")
    }
    
    func getSymbol(symbol: String) -> Image {
        return AmericanMorseStandard.symbolMap[symbol]!
    }
    
    func getSymbolWidth(character: Character) -> Float {
        return AmericanMorseStandard.symbolWidth[character]!
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
