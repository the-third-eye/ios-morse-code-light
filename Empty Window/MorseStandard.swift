//
//  MorseStandard.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/10/21.
//

import Foundation

protocol MorseStandard {
    func getSymbol(character: Character) -> String
    func getUnits(character: Character) -> MorseUnits
    func isCharacter(character: Character) -> Bool
}
