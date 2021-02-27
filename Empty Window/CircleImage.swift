//
//  CircleImage.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/26/21.
//

import SwiftUI
import AVFoundation

struct CircleImage: View {
    
    var body: some View {
        Image("morse-code-2")
            .clipShape(Rectangle())
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
