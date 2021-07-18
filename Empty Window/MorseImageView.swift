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
        Image("international-morse-images/a")
            .padding()
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 53, height: 5, alignment: .leading)
//            .padding([.bottom, .trailing])
    }
}

struct MorseImageView_Previews: PreviewProvider{
    static var previews: some View{
        MorseImageView()
    }
}
