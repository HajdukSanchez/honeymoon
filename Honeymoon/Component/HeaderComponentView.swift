//
//  HeaderComponentView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 16/01/25.
//

import SwiftUI

struct HeaderComponentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundStyle(.secondary)
                .opacity(0.2)
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        }
    }
}

#Preview {
    HeaderComponentView()
}
