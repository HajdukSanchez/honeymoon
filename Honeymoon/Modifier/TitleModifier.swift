//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 11/02/25.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.pink)
    }
}
