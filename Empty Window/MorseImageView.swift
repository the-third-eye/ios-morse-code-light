//
//  MorseImageView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/11/21.
//

import Foundation
import SwiftUI

struct MorseImageView: View {
    
    var body: some View{
     //   Image("c")
           // .resizable()
            //.aspectRatio(contentMode: .fit)
            //.scaleEffect(CGSize(width: 0.1, height: 0.1))
            //.frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
       //     .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//        Image("b")
//            .resizable()
//            .frame(width: 45, height: 6.25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        Image("letter-a-large")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.blue)

    }
}

struct MorseImageView_Previews: PreviewProvider{
    static var previews: some View{
        MorseImageView()
    }
}
