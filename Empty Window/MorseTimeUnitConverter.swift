//
//  MorseConverter.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/26/21.
//

import Foundation

struct MorseTimeUnitConverter{
    
    private var alphabetMap : [Character: [Int]] = [
        "a": [1, 3],
        "b": [3, 1, 1, 1],
        "c": [3, 1, 3, 1],
        "d": [3, 1, 1],
        "e": [1],
        "f": [1,1, 3, 1],
        "g": [3, 3, 1],
        "h": [1,1,1,1] 
    ]
    
    func convert(text: String)-> [[[Int]]] {
        let words = text.split(separator: " ")
        var textUnits: [[[Int]]] = []
        for word in words{
            var wordUnits: [[Int]] = []
            for letter in word{
                guard let units = alphabetMap[letter] else {continue}
                wordUnits.append(units)
            }
            textUnits.append(wordUnits)
        }
        return textUnits
    }
}
