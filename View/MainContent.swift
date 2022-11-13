//
//  MainContent.swift
//  DoughRise
//
//  Created by Delvin Cockroft on 11/10/22.
//

import SwiftUI

struct MainContent: View {
    @ObservedObject var main : MainData
    @StateObject var content = ContentData()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack(alignment: .leading){
            line(content: "Sort: Alphabetical Order", font: .custom("Montserrat", size: 13), weight: .medium, color: content.minorWordColor).padding(.top, 1).padding(.leading, 25)
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(content.contentItems){ item in
                        // MARK: Content Cards
                        if item.id != 100{
                            ZStack{
                                // MARK: Here is the background Rectangle
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(main.colors.background)
                                    .frame(width: 180, height: 135)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray)
                                            .offset(y: 1)
                                            .blur(radius: 2)
                                            .frame(width: 180, height: 135)
                                    )
                                VStack{
                                    // MARK: Here is the title of each content card
                                    line(content: "\(item.name)", font: .custom("Montserrat", size: 13), weight: .medium, color: main.words()).padding(.top, 5)
                                    // MARK: Here is the bar for each content card
                                    VStack(alignment: .leading){
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(
                                                // adjust the color of bar here
                                                LinearGradient(gradient: Gradient(colors: [item.barColorA, item.barColorB]), startPoint: .leading, endPoint: .trailing)
                                            )
                                            .padding([.leading, .trailing], 2)
                                            .frame(width: 161, height: 20)
                                        line(content: "\(item.budgetSpent)% of Budget Spent", font: .custom("Montserrat", size: 10), weight: .medium, color: main.words()).offset(x: 10)
                                    }
                                    .offset(y: -5)
                                    HStack{
                                        let namesOfitems = ["Budget", "Spent", "Left"]
                                        // MARK: Here is the title of each price for budget, spent and Left
                                        VStack(alignment: .leading){
                                            ForEach(namesOfitems, id: \.self){ name in
                                                line(content: "\(name)", font: .custom("Montserrat", size: 10), weight: .medium, color: main.words()).padding([.top, .bottom], 0.25).fixedSize()
                                            }
                                        }
                                        Spacer()
                                            .frame(width: main.width / 17.5)
                                        // MARK: Here is the prices for budget, spent and Left
                                        VStack(alignment: .leading){
                                            ForEach(item.prices, id: \.self){ price in
                                                line(content: "$\(price.amount)", font: .custom("Montserrat", size: 10), weight: .medium, color: item.priceColors[price.id]).padding([.top, .bottom], 0.25).fixedSize()
                                            }
                                        }
                                        Spacer()
                                        // MARK: Here is the icon for the content card
                                        ZStack{
                                            if item.icon != "cont_education"{
                                                appImage(name: item.icon, color: content.iconColor, width: 17, height: 17)
                                            } else {
                                                appImage(name: item.icon, color: content.iconColor, width: 25, height: 25).offset(y: 3)
                                            }
                                            Circle()
                                                .stroke(lineWidth: 3)
                                                .fill(
                                                    LinearGradient(gradient: Gradient(colors: [content.iconCircleColorA, content.iconCircleColorB]), startPoint: .leading, endPoint: .trailing)
                                                )
                                                .frame(width: 30, height: 30)
                                                
                                        }
                                        Spacer()
                                        
                                    }
                                    .offset(y: -5)
                                    .padding(.leading)
                                    Spacer()
                                }
                            }
                            .padding(2)
                        } else {
                            // MARK: Add a Card
                            Button{
                                withAnimation(Animation.spring()){
                                    content.addContentItem()
                                }
                            } label: {
                                ZStack{
                                    // MARK: Here is the background Rectangle
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(main.colors.background)
                                        .frame(width: 180, height: 135)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.gray)
                                                .offset(y: 1)
                                                .blur(radius: 2)
                                                .frame(width: 180, height: 135)
                                        )
                                    VStack{
                                        line(content: "\(item.name)", font: .custom("Montserrat", size: 13), weight: .medium, color: main.words()).padding(.top, 5)
                                        systemImage(name: "plus", color: main.words(), width: 58, height: 58)
                                            .offset(y: 10)
                                    }
                                    .offset(y: -20)
                                }
                            }
                        }
                    }
                }
            }
        }
        .frame(width: main.width / 1.05)
    }
}

class ContentData: ObservableObject{
    @Published var contentItems = [
        /// Rent item
        ContentItem(id: 1, name: "Rent", prices: [price(id: 0, amount: 900),price(id: 1, amount: 250),price(id: 2, amount: 650)],
                    budgetSpent: 75, priceColors: [Color.black, Color.red, Color.green],
                    icon: "cont_rent", barColorA: Color( #colorLiteral(red: 0.9673549533, green: 0.5091555715, blue: 0.9937649369, alpha: 1) ), barColorB: Color( #colorLiteral(red: 0.9503702521, green: 0.2384416759, blue: 0.6253475547, alpha: 1) )),
        /// School Loans item
        ContentItem(id: 2, name: "School Loans", prices: [price(id: 0, amount: 900),price(id: 1, amount: 250),price(id: 2, amount: 650)],
                    budgetSpent: 75,  priceColors: [Color.black, Color.red, Color.green],
                    icon: "cont_education",barColorA: Color( #colorLiteral(red: 0.447810173, green: 0.4549286366, blue: 0.8886737227, alpha: 1) ), barColorB: Color( #colorLiteral(red: 0.126075834, green: 0.3001834154, blue: 0.8780258298, alpha: 1) )),
        /// Eating out item
        ContentItem(id: 3, name: "Eating out",prices: [price(id: 0, amount: 900),price(id: 1, amount: 250),price(id: 2, amount: 650)],
                    budgetSpent: 75, priceColors: [Color.black, Color.red, Color.green],
                    icon: "cont_food",barColorA: Color( #colorLiteral(red: 0.9776633382, green: 0.889601171, blue: 0.1484904289, alpha: 1) ), barColorB: Color( #colorLiteral(red: 0.8956765532, green: 0.68142277, blue: 0.1002806947, alpha: 1) )),
        /// Blank Item for adding
        ContentItem(id: 100, name: "Add A Category", prices: [], budgetSpent: 0, priceColors: [], icon: "", barColorA: Color.black, barColorB: Color.black)
    ]
    @Published var contentItemToAdd = ContentItem(id: 4, name: "Add A Category", prices: [], budgetSpent: 0, priceColors: [], icon: "", barColorA: Color.black, barColorB: Color.black)
    
    @Published var minorWordColor = Color(#colorLiteral(red: 0.5631754857, green: 0.5690958999, blue: 0.5766770351, alpha: 1))
    @Published var iconColor = Color(#colorLiteral(red: 0.3188760579, green: 0.490422368, blue: 0.7536718249, alpha: 1))
    @Published var iconCircleColorA = Color(#colorLiteral(red: 0.2893440425, green: 0.4435892403, blue: 0.6826598048, alpha: 1))
    @Published var iconCircleColorB = Color(#colorLiteral(red: 0.3569739163, green: 0.3845938444, blue: 0.7623971105, alpha: 1))
    
    func addContentItem(){
        self.contentItems.insert(self.contentItemToAdd, at: self.contentItems.count - 1)
    }
    
    struct ContentItem : Identifiable{
        let id: Int
        let name: String
        let prices: [price]
        let budgetSpent: Int
        let priceColors: [Color]
        let icon: String
        let barColorA: Color
        let barColorB: Color
    }
    struct price: Hashable{
        let id: Int
        let amount: Int
    }
}

struct MainContent_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
