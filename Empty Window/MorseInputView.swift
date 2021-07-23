//
//  MorseInputView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct MorseInputView: View{
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var input: String
    
    var body: some View{
        
        VStack{
//            HStack(alignment: .center){
//                NavigationLink(
//                    destination: HomeView()){
//                    Text("Back").font(.system(size: 12))
//                        .foregroundColor(.black)
//                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 6)
//                            .stroke(Color.black, lineWidth: 1)
//                    )
//                    .padding(.leading)
////                        .navigationBarTitle("")
////                        .navigationBarHidden(true)
//                }
//                Spacer()
//            }

            TextEditor(text: $input)
                .background(Color(.secondarySystemBackground))
                .frame(maxWidth: .infinity, maxHeight: 400)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding()

            NavigationLink(
                destination: MorseConversionView(userInput: $input)){
                Text("Convert").font(.system(size: 14))
                    .foregroundColor(.black)
                    .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.leading)
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
            }
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(false)
        .toolbar{
            ToolbarItemGroup{
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25, alignment: .center)
            }
        }
    }
}

struct MorseInputView_Previews: PreviewProvider{
    static var previews: some View{
        MorseInputView(input: "")
    }
}
