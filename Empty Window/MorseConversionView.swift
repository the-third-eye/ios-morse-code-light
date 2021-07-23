//
//  MorseConvertionView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI

struct MorseConversionView: View{
    
    @State private var runningMorse: Bool = false
    @State private var showCharacter: [Bool] = [false]
    
    @State private var showLightModal = false
    @State private var showSoundModal = false
    @State private var showPopover = false
    
    @Binding var userInput: String
    @State var speed: Double = 10.0
    @State var intensity: Double = 10.0
    @State var selectedMorseType: MorseType = .Lights
    @State var selectedStandard: StandardType = .InternationalMorse
    
    var body: some View{
        VStack{
            
//            HStack{
//
//                NavigationLink(destination: HomeView()){
//                    Text("Back").font(.system(size: 12))
//                        .foregroundColor(.black) 
//                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 6)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
////                        .navigationBarTitle("")
////                        .navigationBarHidden(true)
//                }
//                NavigationLink(destination: HomeView()){
//                    Text("Home").font(.system(size: 12))
//                        .foregroundColor(.black)
//                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 6)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
////                        .navigationBarTitle("")
////                        .navigationBarHidden(true)
//                }
//                NavigationLink(destination: Text("Under Construction")){
//                    Text("Share Image").font(.system(size: 12))
//                        .foregroundColor(.black)
//                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 6)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
////                        .navigationBarTitle("")
////                        .navigationBarHidden(true)
//                }
//
//                NavigationLink(destination: Text("Under Construction")){
//                    Text("Save Image").font(.system(size: 12))
//                        .foregroundColor(.black)
//                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 6)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
////                        .navigationBarTitle("")
////                        .navigationBarHidden(true)
//                }
//                Spacer()
//            }.padding(.leading)
//            .navigationTitle("")
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
            
            Image("logo-vector")
                .frame(maxWidth: .infinity, minHeight: 100)
            HStack{
                Button(action: {
                    self.showLightModal = true
                }){
                    Text("Convert To Light").font(.system(size: 14))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                }
                .sheet(isPresented: $showLightModal){
                    MorseLightSettingsView(speed: $speed, brightness: $intensity, userInput: $userInput, selectedStandard: $selectedStandard)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
                Button(action: {
                    //self.showSoundModal = true
                    self.showPopover = true
                }){
                    Text("Convert To Sound").font(.system(size: 14))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                }
//                .sheet(isPresented: $showSoundModal){
//                    MorseSoundSettingsView(speed: $speed, volume: $intensity)
//                }
                .popover(isPresented: $showPopover){
                    Text("Popover")
                        .font(.headline)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            MorseCodeGridView(runningMorse: $runningMorse, showCharacter: $showCharacter,
                              userInput: $userInput, selectedStandard: $selectedStandard)
                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding()
            
            MorseStandardPicker(selectedStandard: $selectedStandard)
                .padding([.leading, .trailing])
            Spacer()
        }
        .toolbar{
            ToolbarItemGroup{
                HStack{
                    Image(systemName: "house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25, alignment: .center)
                    Spacer(minLength: 20)
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25, alignment: .center)
                    Spacer(minLength: 20)
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25, alignment: .center)
                    Spacer(minLength: 20)
                }
            }
        }
    } 
}

struct MorseConversionView_Preview: PreviewProvider{
    static var previews: some View{
        MorseConversionView(userInput: .constant(""))
    }
}
