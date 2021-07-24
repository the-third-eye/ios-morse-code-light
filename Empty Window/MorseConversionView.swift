//
//  MorseConvertionView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/17/21.
//

import Foundation
import SwiftUI
import AVFoundation


struct MorseConversionView: View{
    
    @StateObject
    private var gridState: MorseGridState = MorseGridState()
    
    @StateObject
    private var settings: MorseSettings = MorseSettings()
    
    @State private var showLightModal = false
    @State private var showSoundModal = false
    
    @Binding var userInput: String
    
    var body: some View{
        VStack{
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
                .sheet(isPresented: $showLightModal, onDismiss: {
                    let text = MorseText(text: userInput, standardType: settings.selectedStandard)
                    
                    DispatchQueue.global().async {
                        MorseTorch.playText(text: text, settings: settings, gridState: gridState)
                    }
                }){
                    MorseLightSettingsView(settings: settings, userInput: $userInput)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
                Button(action: {
                    self.showSoundModal = true
                }){
                    Text("Convert To Sound").font(.system(size: 14))
                        .foregroundColor(.black)
                        .padding(.init(top: 2, leading: 10, bottom: 2, trailing: 10))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            MorseCodeGridView(gridState: gridState, settings: settings, userInput: $userInput)
                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding()
            
            MorseStandardPicker(selectedStandard: $settings.selectedStandard)
                .padding([.leading, .trailing])
                .disabled(gridState.isRunning())
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
