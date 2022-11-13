//
//  BottomBar.swift
//  DoughRise
//
//  Created by Delvin Cockroft on 11/10/22.
//

import SwiftUI

struct BottomBar: View {
    @ObservedObject var main : MainData
    @StateObject var bar = BottomBarData()
    var body: some View {
        VStack {
            Divider()
            BottomBarButton(main: main, bar: bar)
        }
    }
}

class BottomBarData : ObservableObject{
    @Published var barItems = [
        BarItem(id: 1, imageName: "bi_house-door-2", title: "Home", isActive: true),
        BarItem(id: 2, imageName: "b1_trend_up", title: "History", isActive: false),
        BarItem(id: 3, imageName: "b1_add_transactions", title: "Transactions", isActive: false),
        BarItem(id: 4, imageName: "b1_goals", title: "Goals", isActive: false),
        BarItem(id: 5, imageName: "settings_icon", title: "Settings", isActive: false)
    ]
    @Published var itemColor = Color(#colorLiteral(red: 0.3188760579, green: 0.490422368, blue: 0.7536718249, alpha: 1))
    @Published var itemColorHighlighted = Color(#colorLiteral(red: 0.9385209084, green: 0.7575306296, blue: 0.4311046004, alpha: 1))

    
    func activate(item: BarItem){
        for i in self.barItems{
            if i.id != item.id{
                self.barItems[i.id - 1].isActive = false
            } else {
                self.barItems[item.id - 1].isActive = true
            }
        }
    }
    
    struct BarItem: Identifiable{
        var id: Int
        var imageName: String
        var title: String
        var isActive: Bool
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomBarButton: View {
    @ObservedObject var main : MainData
    @ObservedObject var bar : BottomBarData
    var body: some View {
        HStack {
            ForEach(bar.barItems){ item in
                Button{
                    bar.activate(item: item)
                }label: {
                    VStack {
                        appImage(name: "\(item.imageName)", color: item.isActive ? bar.itemColorHighlighted : bar.itemColor, width: 16.25, height: 17.25)
                        line(content: "\(item.title)", font: .custom("Montserrat", size: 10), weight: .regular, color: item.isActive ? bar.itemColorHighlighted : bar.itemColor)
                            .fixedSize()
                    }
                    .padding(10)
                    .frame(width: main.width / 6)
                }
                
            }
        }
    }
}
