//
//  MorseToken.swift
//
//  Created by Carlos McNulty on 3/11/21.
//

import Foundation

typealias Token = MorseToken
typealias MorseUnits = [Token]

enum TokenType{
    case SYM
    case SPACE
}

struct MorseToken {
    
    private let type: TokenType
    private let length: Int
    
    init(_ type: TokenType, _ length: Int){
        self.type = type
        self.length = length
    }
    
    func getType() -> TokenType{
        return type
    }
    
    func getLength() -> Int{
        return length
    }
}
