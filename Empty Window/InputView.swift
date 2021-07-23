//
//  InputView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/21/21.
//

import Foundation
import SwiftUI
import WrappingHStack

struct InputView: View{
    
    
    
    @State var input: [String] = ["dot"]
    
    private var images: [String: Image] = [
        "dot": Image("dot"),
        "long-dash": Image("long-dash"),
        "short-dash": Image("short-dash"),
        "longest-dash": Image("longest-dash")
    ]
    
    var body: some View{
        VStack{
            WrappingHStack(input, id: \.self, spacing: WrappingHStack.Spacing.constant(4)){symbol in
                images[symbol]!
                    .resizable()
                    .frame(width: 10, height: 10, alignment: .center)
                    .padding(.bottom, 5)
            }
            Button("dot"){
                input.append("dot")
            }
            Button("long-dash"){
                input.append("long-dash")
            }
            Button("short-dash"){
                input.append("short-dash")
            }
            Button("longest-dash"){
                input.append("longest-dash")
            }
        }
    }
}

struct InputView_Previews: PreviewProvider{
    static var previews: some View{
        InputView()
    }
}
