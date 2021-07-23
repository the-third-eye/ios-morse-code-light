//
//  MorseSymbolView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/21/21.
//

import Foundation
import SwiftUI

struct MorseInputSymbolView: View{
    
    @Binding var selectedStandard: MorseStandard
    
    @State var symbols: [String] = []
    
    var body: some View{
        VStack{
            HStack(spacing: 5){
                ForEach(symbols, id: \.self){symbol in
                    selectedStandard.getSymbol(symbol: symbol)
                }
            }
            
            HStack{
                Button(action: {
                    symbols.append("dot")
                }){
                    Image("dot")
                }
                Button(action: {
                    symbols.append("long-dash")
                }){
                    Image("long-dash")
                }
            }
   
        }
    }
}

struct MorseInputSymbolView_Previews: PreviewProvider{
    static var previews: some View{
        MorseInputSymbolView(selectedStandard: .constant(InternationalMorseStandard()))
    }
}
