//
//  MorseConvertionView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct MorseConversionView: View{
    
    @State var userInput: String = ""
    @State var speed: Double = 10.0
    @State var intensity: Double = 10.0
    @State var selectedMorseType: MorseType = .Lights
    @State var selectedStandard: StandardType = .InternationalMorse
    
    var body: some View{
        VStack{
            
            HStack{
                
                NavigationLink(destination: HomeView()){
                    Text("Back").font(.system(size: 12))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                NavigationLink(destination: HomeView()){
                    Text("Home").font(.system(size: 12))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                NavigationLink(destination: Text("Under Construction")){
                    Text("Share Image").font(.system(size: 12))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                
                NavigationLink(destination: Text("Under Construction")){
                    Text("Save Image").font(.system(size: 12))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                Spacer()
            }.padding(.leading)
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            Image("logo-vector")
                .frame(maxWidth: .infinity, minHeight: 100)
            HStack{
                Button(action: {}){
                    Text("Convert To Light").font(.system(size: 14))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
                Button(action: {}){
                    Text("Convert To Sound").font(.system(size: 14))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            MorseCodeGridView(userInput: $userInput, selectedStandard: $selectedStandard)
                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .center)
                .border(Color.black, width: 1)
                .padding()
            
            MorseStandardPicker(selectedStandard: $selectedStandard)
                .padding([.leading, .trailing])
            Spacer()
        }
    }
}

struct MorseConversionView_Preview: PreviewProvider{
    static var previews: some View{
        MorseConversionView()
    }
}
