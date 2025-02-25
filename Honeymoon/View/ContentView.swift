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
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    
    // MARK: - Cards
    var cardViews: [CardView] = {
        var views = [CardView]()
        // Only show 2 cards in the list
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeyMoonData[index]))
        }
        return views
    }()
    
    // MARK: - Top card
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { card in
            card.id == cardView.id
        }) else {
            return false
        }
        return index == 0
    }
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            Spacer()
            // List of cards
            ZStack {
                ForEach(cardViews) { view in
                    view
                        .zIndex(self.isTopCard(cardView: view) ? 1 : 0)
                }
            }
            .padding(.horizontal)
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
