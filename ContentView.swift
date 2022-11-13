//
//  ContentView.swift
//  DoughRise
//
//  Created by Delvin Cockroft on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mainData = MainData()
    var body: some View {
        MainPage(main: mainData)
    }
}
struct MainPage: View {
    @StateObject var main : MainData
    var body: some View {
        GeometryReader { geo in
            VStack{
                HeaderContent(main: main)
                SecondaryHeaderContent(main: main)
                MainContent(main: main)
                Spacer()
                BottomBar(main: main)
            }
            .frame(width: geo.size.width)
            .onAppear{main.width = geo.size.width}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
