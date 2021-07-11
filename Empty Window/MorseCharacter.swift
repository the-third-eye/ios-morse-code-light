//
//  MorseLetter.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

typealias MorseUnits = [Int]

struct MorseCharacter{
    
    private static let alphabetMap : [Character: MorseUnits] = [
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
    
    private var character: Character
    private var units: MorseUnits
    
    static func isMorseChar(character: Character) -> Bool{
        return alphabetMap.keys.contains(character)
    }
    
    init(character: Character) {
        self.character = character
        self.units = MorseCharacter.alphabetMap[character] ?? []
    }
    
    func getChar() -> Character{
        return character
    }
    
    func getUnits() -> MorseUnits{
        return units
    }
}
