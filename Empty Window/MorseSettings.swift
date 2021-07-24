//
//  MorseSettings.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/23/21.
//

import Foundation
import SwiftUI

class MorseSettings: ObservableObject{
    @Published
    var speed: Float = 1.0
    @Published
    var brightness: Float = 1.0
    @Published
    var selectedStandard: StandardType = .InternationalMorse
}
