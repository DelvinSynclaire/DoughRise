//
//  HeaderContent.swift
//  DoughRise
//
//  Created by Delvin Cockroft on 11/10/22.
//

import SwiftUI

struct HeaderContent: View {
    @ObservedObject var main : MainData
    @StateObject var header = HeaderData()
    
    var body: some View {
        VStack {
            // MARK: September 2021 chevron right and then the add button
            ZStack {
                // Here is our date at the top
                HStack{
                    Spacer()
                    Button{
                        header.dateInfoButton()
                    }label: {
                        systemImage(name: "plus", color: main.words(), width: 16, height: 16)
                    }
                }
                // Here is our add button
                HStack{
                    line(content: "September 2021", font: .custom("Montserrat", size: 14), weight: .medium, color: main.words())
                    Button{
                        header.addButton()
                    }label: {
                        systemImage(name: "chevron.right", color: main.words(), width: 7, height: 14)
                    }
                }
            }
            .frame(width: main.width / 1.15)
            
            // MARK: $0 spent of $6000
            line(content: "$\(header.spent) spent of $\(header.max)", font: .custom("Montserrat", size: 16), weight: .bold, color: main.words())
                .frame(width: 283, height: 37)
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [main.colors.barOneA, main.colors.barOneB]), startPoint: .leading, endPoint: .trailing))
                .frame(width: main.width / 1.1, height: 35)
            HStack{
                line(content: "$\(header.max) Left", font: .custom("Montserrat", size: 10), weight: .medium, color: main.words())
                Spacer()
                line(content: "$\(header.spentTwo) Spent", font: .custom("Montserrat", size: 10), weight: .medium, color: main.words())
            }
            .frame(width: main.width / 1.1 - 10, height: 35)
        }
        
    }
}

class HeaderData : ObservableObject{
    @Published var spent : Int
    @Published var spentTwo : Int
    @Published var max : Int
    
    init(){
        spent = 0
        spentTwo = 1000
        max = 6000
    }
    
    func dateInfoButton(){
        print("Date arrow pressed : View -> HeaderContent For more info")
    }
    func addButton(){
        print("Add button pressed : View -> HeaderContent For more info")
    }
}

struct HeaderContent_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
