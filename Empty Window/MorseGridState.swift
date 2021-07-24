//
//  MorseGridState.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/23/21.
//

import Foundation
import SwiftUI

class MorseGridState: ObservableObject{
    
    @Published
    private var running = false
    
    @Published
    private var positionOn: Int? = nil
    
    private var characters: [MorseCharacter]? = nil
    
    func isRunning() -> Bool{
        return running == true
    }
    
    func start(_ characters: [MorseCharacter]) {
        self.characters = characters
        running = true
    }
    
    func stop(){
        running = false
        positionOn = nil
        characters = nil
    }
    
    func getChar() -> Character?{
        if positionOn != nil && characters != nil{
            return characters![positionOn!].getChar()
        }
        return nil
    }
    
    func isOn(_ pos: Int) -> Bool {
        if positionOn != nil
            && positionOn! == pos{
            return true
        }
        return false
    }
    
    func setOn(_ pos: Int){
        if running{
            positionOn = pos
        }
    }
    
    func setOff(){
         positionOn = nil
    }
    

}
