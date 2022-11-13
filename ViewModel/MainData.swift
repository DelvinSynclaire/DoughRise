//
//  MainData.swift
//  DoughRise
//
//  Created by Delvin Cockroft on 11/10/22.
//

import Foundation
import SwiftUI

class MainData : ObservableObject{
    @Published var width : CGFloat = 0.0
    @Published var height : CGFloat = 0.0
    
    @Published var colors = Colors(
        words: Color( #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) ), background: Color( #colorLiteral(red: 0.9879267812, green: 0.9890204072, blue: 0.9962320924, alpha: 1) ),
        barOneA: Color( #colorLiteral(red: 0.57246387, green: 0.8810024261, blue: 0.5859649777, alpha: 1) ), barOneB: Color( #colorLiteral(red: 0.318156749, green: 0.7322325706, blue: 0.2185983658, alpha: 1) ))

}

func line(content: String, font: Font, weight: Font.Weight, color: Color) -> some View{
    Text("\(content)")
        .font(font)
        .fontWeight(weight)
        .foregroundColor(color)
}
func systemImage(name: String, color: Color, width: CGFloat, height: CGFloat) -> some View {
    Image(systemName: name)
        .resizable()
        .scaledToFit()
        .foregroundColor(color)
        .frame(width: width, height: height)
}

func appImage(name: String, color: Color, width: CGFloat, height: CGFloat) -> some View {
    Rectangle()
        .foregroundColor(color)
        .frame(width: width, height: height)
        .mask(
            Image(name)
                .resizable()
                .scaledToFit()
        )
}

