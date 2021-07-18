//
//  NavView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct NavView: View{
    var body: some View{
        TextEditor(text: .constant("Placeholder"))
//        NavigationView{
//            VStack{
//                Image("logo-vector")
//                    .frame(maxWidth: .infinity, minHeight: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                NavigationLink(destination: MorseInputView()
//                                .navigationBarBackButtonHidden(true)
//                                .navigationBarTitle("")
//                                .navigationBarHidden(true)
//                ) {
//                    Text("Convert To Morse").font(.system(size: 12))
//                        .foregroundColor(.black).padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 6)
//                            .stroke(Color.black, lineWidth: 1)
//                    )
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
//                }
//                .navigationTitle("Navigation")
//                NavigationLink(
//                    destination: Text("Under Construction")){
//                    Text("Convert From Morse").font(.system(size: 12))
//                        .foregroundColor(.black).padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 6)
//                            .stroke(Color.black, lineWidth: 1)
//                    )
//                }
//                NavigationLink(
//                    destination: Text("Under Construction")){
//                    Text("Learn Morse").font(.system(size: 12))
//                        .foregroundColor(.black).padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 6)
//                            .stroke(Color.black, lineWidth: 1)
//                    )
//
//                }
//                Image("logo-vector")
//                    .frame(maxWidth: .infinity, minHeight: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            }
//
//
//
//        }
    }
}

struct NavView_Preview: PreviewProvider{
    static var previews: some View{
        NavView()
    }
}
