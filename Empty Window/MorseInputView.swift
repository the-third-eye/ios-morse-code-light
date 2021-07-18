//
//  MorseInputView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct MorseInputView: View{
    var body: some View{

        VStack{
            HStack(alignment: .center){
                NavigationLink(
                    destination: HomeView()){
                    Text("Back").font(.system(size: 12))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.leading)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                Spacer()
            }

            TextEditor(text: .constant(""))
                .background(Color(.secondarySystemBackground))
                .frame(maxWidth: .infinity, maxHeight: 400)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding()

            NavigationLink(
                destination: MorseConversionView()){
                Text("Convert").font(.system(size: 14))
                    .foregroundColor(.black)
                    .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.leading)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            Spacer()
        }
    }
}

struct MorseInputView_Previews: PreviewProvider{
    static var previews: some View{
        MorseInputView()
    }
}
