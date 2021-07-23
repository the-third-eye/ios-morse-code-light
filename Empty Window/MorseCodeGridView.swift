//
//  MorseCodeGridView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import SwiftUI

struct MorseCodeGridView: View {
    
    @Binding var runningMorse: Bool
    @Binding var showCharacter: [Bool]
    @Binding var userInput: String
    @Binding var selectedStandard: StandardType
    @State var showingImage = false
    @State var pressed = false
    @State var characterPressed: Character = "a"

    var body: some View{
        ZStack(alignment: .center){
            let characters = MorseText(text: userInput, standardType: selectedStandard).getCharacters()
            let count = max(1, characters.count)
            ScrollView{
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 25, maximum: 280), spacing: 40), count: 3), alignment: .leading, spacing: 10){
                    ForEach(0..<count, id: \.self){ index in
                        if characters.count == 0{
                            MorseImageView()
                                .padding(.bottom)
                        }
                        else{
                            let character = characters[index]
                            let width = character.getSymbolWidth() * 0.35
                            let height = 25 * 0.35
                            Button(action: {
                                
//                                print("button pressed")
//                                self.showImage()
                            }){
                                characters[index].getImage()
                                    .resizable()
                                    .frame(width: CGFloat(width), height: CGFloat(height), alignment: .center)
                                    .padding(.bottom, 10)
                                    .padding(.trailing, 10)
                            }
                            .onLongPressGesture(minimumDuration: 2.5, maximumDistance: .infinity, pressing: {pressing in
                                withAnimation(.linear(duration: 0.25)){
                                    self.pressed = pressing
                                }
                                if pressing{
                                    print("long press starts")
                                    self.characterPressed = character.getChar()
                                }
                                else{
                                    print("long press ends")
                                }
                            }, perform: {})
                        }
                    }
                }
                .padding()
            }
            if pressed{
                Image("alphabet-vector/"+String(characterPressed))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .background(Color.white)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    private func showImage(){
        self.showingImage = true
        DispatchQueue.main.asyncAfter(deadline: .now()+2){
            self.showingImage = false
        }
    }
}

struct MorseCodeGridView_Previews: PreviewProvider {
    static var previews: some View {
        MorseCodeGridView(runningMorse: .constant(false), showCharacter: .constant([false]), userInput: .constant("a"), selectedStandard: .constant(.AmericanMorse))
    }
}
