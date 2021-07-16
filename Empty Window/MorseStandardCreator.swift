//
//  MorseStandardCreator.swift
//
//  Created by Carlos McNulty on 7/11/21.
//

import Foundation

enum StandardType: CaseIterable {
    case AmericanMorse
    case InternationalMorse
}

class MorseStandardCreator {
    
    private init(){}
    
    static func create(standardType: StandardType) -> MorseStandard{
        switch standardType {
        case .AmericanMorse:
            return AmericanMorseStandard();
        case .InternationalMorse:
            return InternationalMorseStandard();
        }
    }
}
