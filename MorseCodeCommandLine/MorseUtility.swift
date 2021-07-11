//
//  MorseUtility.swift
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

struct MorseUtility{
    
    static func cleanInput(text: String, standard: MorseStandard) -> String{
        // Convert to lower case and strip all characters not in alphabet or white space
        return text.lowercased()
            .filter{ standard.isCharacter(character: $0) || $0.isWhitespace }
    }
}
