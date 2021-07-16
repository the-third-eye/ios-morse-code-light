//
//  MorseTextEditor.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/12/21.
//

import Foundation
import SwiftUI

struct MorseTextEditor: View{
    
    let placeholder: String
    @Binding var userInput: String
    var body: some View {
        ZStack(alignment: .topLeading) {
            if userInput.isEmpty  {
                Text(placeholder)
                    .foregroundColor(Color.primary.opacity(0.25))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 14))
                    .padding()
            }
            TextEditor(text: $userInput)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .lineSpacing(5.0)
                .font(.system(size: 14))
                .padding()
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }
    }
}

struct MorseTextEditor_Previews: PreviewProvider{
    static var previews: some View{
        MorseTextEditor(placeholder: "Start Typing...", userInput: .constant("Hello how are you?"))
    }
}
