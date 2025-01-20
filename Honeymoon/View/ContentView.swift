//
//  ContentView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            CardView(honeymoon: honeyMoonData[0])
                .padding()
            Spacer()
            FooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Success".uppercased()),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple!"),
                dismissButton: .default(Text("Happy Honeymoon"))
            )
        }
    }
}

#Preview {
    ContentView()
}
