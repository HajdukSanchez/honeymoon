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
    @State private var lastCardIndex: Int = 1 // Strats in 1 because we start show 2 cards
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    
    // MARK: - Cards
    @State private var cardViews: [CardView] = {
        var views = [CardView]()
        // Only show 2 cards in the list
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeyMoonData[index]))
        }
        return views
    }()
    
    private func moveCards() {
        // Remove the top card from the array (the card user is interact with)
        self.cardViews.removeFirst()
        // Track the new card user is seeing
        self.lastCardIndex += 1
        // This allow us to get the next card inside the boundaries of the array and always show a new card without exeed the bounds
        let honeymoon = honeyMoonData[self.lastCardIndex % honeyMoonData.count]
        // Using this new card to show, we append the next card on the array
        let newCardView = CardView(honeymoon: honeymoon)
        // Set the new card in the arrya so user can see it
        self.cardViews.append(newCardView)
    }
    
    // MARK: - Top card
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { card in
            card.id == cardView.id
        }) else {
            return false
        }
        return index == 0
    }
    
    private func userReachesDislikeAreaThreshold(withDrag dragWidth: CGFloat) -> Bool {
        return dragWidth < -self.dragAreaThreshold
    }
    
    private func userReachesLikeAreaThreshold(withDrag dragWidth: CGFloat) -> Bool {
        return dragWidth > self.dragAreaThreshold
    }
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(self.dragState.isDragging ? 0.0 : 1.0)
                .animation(self.dragState.isDragging ? nil : .default, value: self.dragState.isDragging)
            Spacer()
            // List of cards
            ZStack {
                ForEach(cardViews) { view in
                    if !self.isTopCard(cardView: view) {
                        // Card behind the animated one
                        view.zIndex(0)
                    } else {
                        // Card with animation and gesture interaction (top cad)
                        view
                            .zIndex(1)
                            .overlay(content: {
                                ZStack {
                                    // Symbol on the left
                                    Image(systemName: "x.circle")
                                        .modifier(SymbolModifier())
                                        .foregroundStyle(.red)
                                        .opacity(
                                            self.userReachesDislikeAreaThreshold(withDrag: self.dragState.translation.width) ? 1 : 0
                                        )
                                    // Symbol on the right
                                    Image(systemName: "heart.circle")
                                        .modifier(SymbolModifier())
                                        .foregroundStyle(.green)
                                        .opacity(
                                            self.userReachesLikeAreaThreshold(withDrag: self.dragState.translation.width) ? 1 : 0
                                        )
                                }
                            })
                            .offset(
                                x: self.dragState.translation.width,
                                y: self.dragState.translation.height
                            )
                            .scaleEffect(self.dragState.isDragging ? 0.85 : 1.0)
                            .rotationEffect(Angle(degrees: Double(self.dragState.translation.width / 12)))
                            .animation(
                                .interpolatingSpring(stiffness: 120, damping: 120),
                                value: self.dragState.isDragging
                            )
                            .gesture(
                                LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { value, state, transaction in
                                        switch value {
                                        case .first(true):
                                            state = .pressing
                                        case .second(true, let drag):
                                            state = .dragging(translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                                    .onEnded({ value in
                                        // If user perform a drag gesture, get the value on the drag? value
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        
                                        let dragWith = drag.translation.width
                                        
                                        // Validate if the user reach the limits when we show the dislike or like actions, to perform a specific action apart
                                        if  self.userReachesLikeAreaThreshold(withDrag: dragWith) || self.userReachesDislikeAreaThreshold(withDrag: dragWith) {
                                            // Perform change cards action
                                            self.moveCards()
                                        }
                                    })
                            )
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
            FooterView(showBookingAlert: $showAlert)
                .opacity(self.dragState.isDragging ? 0.0 : 1.0)
                .animation(self.dragState.isDragging ? nil : .default, value: self.dragState.isDragging)
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

// MARK: - DragState
private enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    // Return a CGSize translation based on the state
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    // Get if the user has a dragging state
    var isDragging: Bool {
        switch self {
        case .inactive, .pressing:
            return false
        case .dragging:
            return true
        }
    }
    
    // Get if the user has a pressing state
    var isPressing: Bool {
        switch self {
        case .inactive:
            return false
        case .pressing, .dragging:
            return true
        }
    }
}
