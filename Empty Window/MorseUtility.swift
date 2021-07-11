//
//  MorseUtility.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

struct MorseUtility{
    
    static func cleanInput(text: String) -> String{
        // Convert to lower case and strip all characters not in alphabet or white space
        return text.lowercased()
            .filter{ MorseCharacter.isMorseChar(character: $0) || $0.isWhitespace }
    }
}
