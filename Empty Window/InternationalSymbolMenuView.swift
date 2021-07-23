//
//  TestSwapView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/21/21.
//

import Foundation
import SwiftUI

enum SYM_TYPE {
    case DOT
    case DASH
}

struct SymbolMap{
    private static var symbols: [SYM_TYPE: Image] = [
        .DOT: Image("international-symbols/dot"),
        .DASH: Image("international-symbols/dash")
    ]

    private static var widths: [SYM_TYPE: Float] = [
        .DOT: 25.0,
        .DASH: 75.0
    ]
    
    static func getImage(symbol: SYM_TYPE, scalar: Float) -> some View {
        return symbols[symbol]!.resizable()
            .frame(width: CGFloat(widths[symbol]!*scalar),
                   height: CGFloat(25.0*scalar), alignment: .center)
    }
}

struct InternationalSymbolMenuView: View{
    
    @State var inputSymbols: [SYM_TYPE] = []
    @State var inputText: String = ""
    @State var inputChar: Character? = nil
    
    @State var showSymbols = false
    @State var showLetter = false
    
    func getWidth(g: GeometryProxy) -> CGFloat {
        print(g.size.width, ", ", g.size.height)
        
        return 100.0
    }
    
    var body: some View{
        VStack{
            ScrollView{
                VStack{
                    Text(inputText)
                        .font(.system(size: 25))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing], 10)
                }
            }.frame(maxWidth: .infinity, maxHeight: 300)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding([.leading, .trailing])
            .padding(.bottom, 20)
            if showSymbols{
                HStack{
                    HStack(alignment: .center){
                        ForEach(inputSymbols, id: \.self){symbol in
                            SymbolMap.getImage(symbol: symbol, scalar: 1)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
            }
            else if inputChar != nil{
                
                if inputChar!.isLetter{
                    Image("alphabet-vector/"+String(inputChar!))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(Color.white)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
                else{
                    Image("invalid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(Color.white)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }

            }
            else{
                Spacer()
                    .frame(height: 100)
            }
            HStack(spacing: 20){
                Button(action: {
                    inputSymbols = []
                    inputChar = nil
                    showSymbols = false
                    showLetter = false
                }){
                    Image(systemName: "clear")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                Button(action: {
                    showSymbols = true
                    inputSymbols.append(.DOT)
                }){
                    SymbolMap.getImage(symbol: .DOT, scalar: 1.5)
                }
                Button(action: {
                    showSymbols = true
                    inputSymbols.append(.DASH)
                }){
                    SymbolMap.getImage(symbol: .DASH, scalar: 1.5)
                }
                Button(action: {
                    if !inputSymbols.isEmpty{
                        inputSymbols.removeLast()
                        if inputSymbols.isEmpty{
                            showSymbols = false
                        }
                    }
                }){
                    Image(systemName: "delete.left")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.top, 20)
            HStack(spacing: 20){
                Button(action: {
                   inputText += " "
                }){
                    Text("Space")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .padding([.leading, .trailing], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        
                }
                .padding(.top, 15)
                Button(action: {
                    showSymbols = false
                    if !inputSymbols.isEmpty{
                        inputChar =
                            InternationalMorseStandard.getLetter(symbols: inputSymbols)
                        if inputChar != nil{
                            inputText += String(inputChar!)
                        }
                        else{
                            inputChar = "."
                        }
                    }
                    else if inputChar != nil{
                        inputText += String(inputChar!)
                    }
                    inputSymbols = []
                }){
                    Text("Enter")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .padding([.leading, .trailing], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        
                }
                .padding(.top, 15)
            }
      
            
            
            Spacer()
        }
    }
}

struct InternationalSymbolMenuView_Previews: PreviewProvider{
    static var previews: some View{
        InternationalSymbolMenuView()
    }
}
