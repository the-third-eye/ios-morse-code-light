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
        let columns: [GridItem] = [GridItem(.adaptive(minimum: 53), spacing: 10)]
        let characters = MorseText(text: userInput, standardType: selectedStandard).getCharacters()
        let count = max(1, characters.count)
        ScrollView{
            LazyVGrid(columns: columns, alignment: .leading, spacing: 5){
                ForEach(0..<count, id: \.self){ index in
                    if characters.count == 0{
                        MorseImageView()
                            .padding(.bottom)
                    }
                    else{
                        characters[index].getImage()
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            //.frame(width: 55, height: 5, alignment: .leading)
//                            .padding([.bottom, .trailing])
                    }
                }
            }
        }
    }
}

struct MorseCodeGridView_Previews: PreviewProvider {
    static var previews: some View {
        MorseCodeGridView(userInput: .constant("yzyzyzyzyaaaaaayyaaaaaa"), selectedStandard: .constant(.InternationalMorse))
    }
}
