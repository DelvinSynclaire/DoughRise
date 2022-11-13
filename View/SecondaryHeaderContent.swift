//
//  SecondaryHeaderContent.swift
//  DoughRise
//
//  Created by Delvin Cockroft on 11/10/22.
//

import SwiftUI

struct SecondaryHeaderContent: View {
    @ObservedObject var main : MainData

    var body: some View {
        line(content: "Breakdown of your Budget", font: .custom("Montserrat", size: 14), weight: .medium, color: main.words())
        
    }
}

struct SecondaryHeaderContent_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
