//
//  TestView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/23/21.
//

import Foundation
import SwiftUI

struct TestView: View{
    
    @State var image: Image = Image(systemName: "clear")
    @State private var workItem: DispatchWorkItem?
    @State private var runningMorse: Bool = false
    @State private var characterRunning: Character? = nil
    
    var body: some View{
        HStack{
            image
                .foregroundColor(.gray)
            Button(action: {
                print("hello")
                self.runMorse()
            }){
                Image(systemName: "play")
                    //.renderingMode(.original)
                    .foregroundColor(getColor())
            }
            .disabled(runningMorse)
        }
    }
    
    func getColor() -> Color{
        if runningMorse{
            return .gray
        }
        return .black
    }
    
    func runMorse(){
        self.workItem =  DispatchWorkItem{
            
            DispatchQueue.main.async{
                runningMorse = true
                characterRunning = "a"
                image = Image(systemName: "speaker")
            }
            Thread.sleep(forTimeInterval: 5)
            DispatchQueue.main.async {
                runningMorse = false
                characterRunning = nil
                image = Image(systemName: "flame")
            }
        }
        if workItem != nil{
            DispatchQueue.global().async(execute: workItem!)
        }
    }
}

struct TestView_Previews: PreviewProvider{
    static var previews: some View{
        TestView()
    }
}
