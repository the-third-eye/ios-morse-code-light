//
//  ImageMap.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/13/21.
//

import Foundation
import SwiftUI

protocol ImageMap {
    func getImage(character: Character, scalar: Float) -> Image
    func getSymbol(symbol: String) -> Image
    func getSymbolWidth(character: Character) -> Float
}
