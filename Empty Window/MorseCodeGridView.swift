//
//  MorseCodeGridView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 3/7/21.
//

import SwiftUI

struct MorseCodeGridView: View {
        
    @Binding var userInput: String
    @Binding var selectedStandard: StandardType
    
    var body: some View {
        let columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 5)
        let characters = MorseText(text: userInput, standardType: selectedStandard).getCharacters()
        let count = max(1, characters.count)
        ScrollView{
            LazyVGrid(columns: columns, spacing: 5){
                ForEach(0..<count, id: \.self){ index in
                    if characters.count == 0{
                        MorseImageView()
                            .padding(.bottom)
                    }
                    else{
                        characters[index].getImage()
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 55, height: 5, alignment: .center)
                            .padding([.bottom, .trailing])
                    }
                }
            }
            .padding(.horizontal)
        }.padding()
    }
}

struct MorseCodeGridView_Previews: PreviewProvider {
    static var previews: some View {
        MorseCodeGridView(userInput: .constant("abcdefghijklmnopqrstuvwxyz"), selectedStandard: .constant(.InternationalMorse))
    }
}
