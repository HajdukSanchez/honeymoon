//
//  ContentView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            CardView(honeymoon: honeyMoonData[0])
                .padding()
            Spacer()
            FooterView()
        }
    }
}

#Preview {
    ContentView()
}
