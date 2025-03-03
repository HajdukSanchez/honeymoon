//
//  CardTransition.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 3/03/25.
//

import SwiftUI

extension AnyTransition {
    // This animation will be trigger when user trow away a card from the right part of the screen
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom))
        )
    }
    
    // This animation will be trigger when user trow away a card from the left part of the screen
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom))
        )
    }
}
