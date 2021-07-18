//
//  HomeView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct HomeView: View{

    var body: some View{
        VStack{
            Image("logo-placeholder")
                .frame(maxWidth: .infinity, minHeight: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Button(action: {}){
                Text("Convert To Morse").font(.system(size: 12))
                    .foregroundColor(.black).padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(.bottom)
            Button(action: {}){
                Text("Convert From Morse").font(.system(size: 12))
                    .foregroundColor(.black).padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(.bottom)
            Button(action: {}){
                Text("Learn Morse").font(.system(size: 12))
                    .foregroundColor(.black).padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black, lineWidth: 1)
            )
            Image("logo-placeholder")
                .frame(maxWidth: .infinity, minHeight: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct HomeView_Preview: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
