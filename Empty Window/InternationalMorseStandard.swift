//
//  InternationalMorseStandard.swift
//
//  Created by Carlos McNulty on 3/10/21.
//

import Foundation
import SwiftUI

struct InternationalMorseStandard: MorseStandard{
    
    private static let IMAGE_DIRECTORY = "international-vector"
    
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
    
    private static let symbolMap: [String: Image] = [
        "dot": Image("dot"),
        "long-dash": Image("long-dash")
    ]
    
    
    private static let imageMap: [Character: Image] = [
        "a": Image("international-vector/a"),
        "b": Image("international-vector/b"),
        "c": Image("international-vector/c"),
        "d": Image("international-vector/d"),
        "e": Image("international-vector/e"),
        "f": Image("international-vector/f"),
        "g": Image("international-vector/g"),
        "h": Image("international-vector/h"),
        "i": Image("international-vector/i"),
        "j": Image("international-vector/j"),
        "k": Image("international-vector/k"),
        "l": Image("international-vector/l"),
        "m": Image("international-vector/m"),
        "n": Image("international-vector/n"),
        "o": Image("international-vector/o"),
        "p": Image("international-vector/p"),
        "q": Image("international-vector/q"),
        "r": Image("international-vector/r"),
        "s": Image("international-vector/s"),
        "t": Image("international-vector/t"),
        "u": Image("international-vector/u"),
        "v": Image("international-vector/v"),
        "w": Image("international-vector/w"),
        "x": Image("international-vector/x"),
        "y": Image("international-vector/y"),
        "z": Image("international-vector/z"),
    ]
  
    
    public static let symbolWidth: [Character: Float] = [
        "a": 110.0,
        "b": 180.0,
        "c": 110.0,
        "d": 145.0,
        "e": 25.0,
        "f": 180,
        "g": 195,
        "h": 130,
        "i": 60,
        "j": 280,
        "k": 195,
        "l": 180,
        "m": 160,
        "n": 110,
        "o": 245,
        "p": 230,
        "q": 280,
        "r": 145,
        "s": 95,
        "t": 75,
        "u": 145,
        "v": 280,
        "w": 195,
        "x": 230,
        "y": 280,
        "z": 230
    ]
    
    private static func getSymType(token: Token) -> SYM_TYPE{
        if token.getLength() == 1{
            return .DOT
        }
        else{
            return .DASH
        }
    }
    
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
    
    static func getLetter(symbols: [SYM_TYPE]) -> Character?{
        for (character, units) in unitsMap{
            let charSymbols = units.map{ getSymType(token: $0)}
            if charSymbols == symbols{
                return character
            }
        }
        return nil
    }
    
    func getImage(character: Character, scalar: Float = 1.0) -> Image{
//        let width: Float = InternationalMorseStandard.symbolWidth[character] ?? 110.0 * scalar
//        let height: Float = 25 * scalar
//
//        print(width, height)
//
//        let image = InternationalMorseStandard.imageMap[character] ?? Image("a")
//            .resizable()
//            .frame(width: CGFloat(width), height: CGFloat(height), alignment: .center) as! Image
//
//        return image
        return InternationalMorseStandard.imageMap[character]!
    }
    
    func getSymbol(symbol: String) -> Image {
        return InternationalMorseStandard.symbolMap[symbol]!
    }
    
    func getSymbolWidth(character: Character) -> Float {
        return InternationalMorseStandard.symbolWidth[character]!
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
