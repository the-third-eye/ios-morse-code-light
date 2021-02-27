//
//  ContentView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 2/22/21.
//

import SwiftUI
import AVFoundation



struct ContentView: View {
    
    @State var userInput: String = ""
    
    var body: some View {
        
        VStack{
            
            CircleImage()
                .padding(.top, 80)
                .padding(.bottom, 200)
            VStack {

                MyButton(userInput: $userInput)

                Divider()
                TextField("Please Enter: ", text: $userInput)
                    .font(.title3)
                    .frame(width: 300, height: 80, alignment: .center)
                Divider()

            }
            .padding()
            
            Spacer()
        }
        .background(Color.white      )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
