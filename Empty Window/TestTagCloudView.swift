//
//  TagCloudView.swift
//  Empty Window
//
//  Created by Carlos McNulty on 7/20/21.
//

import Foundation
import SwiftUI
import WrappingHStack

//struct TagCloudView: View {
//    var tags: [String]
//
//    @State private var totalHeight
//          = CGFloat.zero       // << variant for ScrollView/List
//    //    = CGFloat.infinity   // << variant for VStack
//
//    let widths: [String: Float] = [
//        "e": 25.0*0.4,
//        "l": 100.0*0.4,
//        "t": 50.0*0.4
//    ]
//
//    var body: some View {
//        VStack {
//            GeometryReader { geometry in
//                self.generateContent(in: geometry)
//            }
//        }
//        .frame(height: totalHeight)// << variant for ScrollView/List
//        //.frame(maxHeight: totalHeight) // << variant for VStack
//    }
//
//    private func generateContent(in g: GeometryProxy) -> some View {
//        var width = CGFloat.zero
//        var height = CGFloat.zero
//
//        return ZStack(alignment: .topLeading) {
//            ForEach(self.tags, id: \.self) { tag in
//                self.item(for: tag)
//                    .padding([.horizontal, .vertical], 4)
//                    .alignmentGuide(.leading, computeValue: { d in
//                        if (abs(width - d.width) > g.size.width)
//                        {
//                            width = 0
//                            height -= d.height
//                        }
//                        let result = width
//                        if tag == self.tags.last! {
//                            width = 0 //last item
//                        } else {
//                            width -= d.width
//                        }
//                        return result
//                    })
//                    .alignmentGuide(.top, computeValue: {d in
//                        let result = height
//                        if tag == self.tags.last! {
//                            height = 0 // last item
//                        }
//                        return result
//                    })
//            }
//        }.background(viewHeightReader($totalHeight))
//    }
//
//    private func item(for character: String) -> some View {
//
//       // print("CHARACTER: " + String(character))
//        Text(character)
//            .padding(.all, 5)
//            .font(.body)
//            .background(Color.blue)
//            .foregroundColor(Color.white)
//            .cornerRadius(5)
//        return Image(String(character))
//            .resizable()
//            .frame(width: CGFloat(widths[character]!), height: 25*0.4, alignment: .center)
//            .padding(.bottom, 10)
//            .padding(.trailing, 10)
//            .clipped()
//    }
//
//    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
//        return GeometryReader { geometry -> Color in
//            let rect = geometry.frame(in: .local)
//            DispatchQueue.main.async {
//                binding.wrappedValue = rect.size.height
//            }
//            return .clear
//        }
//    }
//}
//
//struct TestTagCloudView : View {
//    var body: some View {
//        VStack {
//            Text("Header").font(.largeTitle)
//            TagCloudView(tags: ["e", "t", "t", "e"])
//        }
//    }
//}

struct TagCloudView: View {
    var tags: [String]

    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        print("tag: ", text)
        return Text(text)
            .padding(.all, 5)
            .font(.body)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(5)
            .frame(width: 40, height: 40)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct TestTagCloudView : View {
    var body: some View {
         VStack {
             Text("Header").font(.largeTitle)
             TagCloudView(tags: ["e", "l", "1", "1"])
         }
     }
}
