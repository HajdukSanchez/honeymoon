//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 11/02/25.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background {
                Capsule().fill(.pink)
            }
            .foregroundStyle(.white)
    }
}
