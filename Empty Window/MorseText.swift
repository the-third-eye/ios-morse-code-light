//
//  MorseText.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import Foundation

struct MorseText{
   
    private var words: [MorseWord] = []
    
    init(){}
    
    init(text: String) {
        let tokens =
            MorseUtility.cleanInput(text: text).split(separator: " ")
        
        for token in tokens{
            words.append(MorseWord(word: String(token)))
        }
    }
    
    init(words: MorseWord...){
        for word in words{
            self.words.append(word)
        }
    }
    
    init(words: [MorseWord]){
        self.words = words
    }
    
    mutating func addWord(word: MorseWord){
        words.append(word)
    }
    
    func getWords() -> [MorseWord] {
        return words
    }
    
    func getLength() -> Int{
        return words.count
    }
}

/* ***** PSEUDO CODE SECTIONS THAT MIGHT BE USEFUL FOR UI ***** */
/* ****** DON'T EXPECT ALL METHODS IN PSEUDO CODE TO EXIST ****** */

/*
    ***** PSUEDO CODE FOR USER INPUT WITH RANDOM INSERTIONS AND DELETIONS *****
 
    while(true){
        textField = TextField()
        if textField.isChanged(){
 
            if textField.wasCharacterAdded(){
                c = textField.characterAdded()
                if MorseCharacter.isMorseChar(c){
                    character = MorseCharacter(c)
                    get image associated with character
                    blow up associated image over center of morse code grid
                }
            }
 
            reset morse code grid
            text = MorseText(textField.getText())
            for word in text.getWords(){
                for character in word.getCharacters(){
                    get image for character
                    add image to morse code grid
                }
            }
        }
    }
 
 */


/*
    ***** PSUEDO CODE FOR PARSING USER INPUT INTO MORSE CODE *****
 
 
    word = MorseWord()
    text = MorseText()
    while(user.hasNext()){
        c = user.getChar()
        if c is space{
            if word.length() > 0{
                text.addWord(word)
                word = MorseWord()
            }
        }
        else if MorseCharacter.isMorseChar(c){
            word.addCharacter(MorseCharacter(c))
            run add character animation
        }
    }
    text.animate()
 
 */
