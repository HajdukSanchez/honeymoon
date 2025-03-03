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
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    
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
    
    private func showDislikeSymbol() -> Bool {
        return self.dragState.translation.width < -self.dragAreaThreshold
    }
    
    private func showLikeSymbol() -> Bool {
        return self.dragState.translation.width > self.dragAreaThreshold
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
                                        .opacity(self.showDislikeSymbol() ? 1 : 0)
                                    // Symbol on the right
                                    Image(systemName: "heart.circle")
                                        .modifier(SymbolModifier())
                                        .foregroundStyle(.green)
                                        .opacity(self.showLikeSymbol() ? 1 : 0)
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
