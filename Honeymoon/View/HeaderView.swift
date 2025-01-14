//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 14/01/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
        }
        .padding()
    }
}

#Preview {
    HeaderView()
}
