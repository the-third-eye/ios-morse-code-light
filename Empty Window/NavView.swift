//
//  NavView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct NavView: View{
    
    @State var test: String = "help"
    @State var selectedStandard: MorseStandard = InternationalMorseStandard()
    
    var body: some View{
        NavigationView{
            VStack{
                Image("logo-vector")
                    .frame(maxWidth: .infinity, minHeight: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                NavigationLink(destination: MorseInputView(userInput: "")
                ) {
                    Text("Convert To Morse").font(.system(size: 12))
                        .foregroundColor(.black).padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                .navigationTitle("Navigation")
                NavigationLink(
                    destination: InternationalSymbolMenuView()){
                    Text("Convert From Morse").font(.system(size: 12))
                        .foregroundColor(.black).padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
                NavigationLink(
                    destination: LearnAmericanMorseView(settings: MorseSettings())){
                    Text("Learn American Morse").font(.system(size: 12))
                        .foregroundColor(.black).padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )

                }
                NavigationLink(
                    destination: LearnInternationalMorseView(settings: MorseSettings())){
                    Text("Learn International Morse").font(.system(size: 12))
                        .foregroundColor(.black).padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )

                }
                Image("logo-vector")
                    .frame(maxWidth: .infinity, minHeight: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
        .accentColor(.black)
    }
}

struct NavView_Preview: PreviewProvider{
    static var previews: some View{
        NavView()
    }
}
