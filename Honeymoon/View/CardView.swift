//
//  CardView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 14/01/25.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    // MARK: - Properties
    let id = UUID()
    var honeymoon: Destination
    
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(alignment: .bottom) {
                VStack(alignment: .center, spacing: 12) {
                    Text(honeymoon.place.uppercased())
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1)
                        }
                    Text(honeymoon.country.uppercased())
                        .foregroundStyle(.black)
                        .font(.footnote)
                        .bold()
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(.white)
                        )
                }
                .frame(minWidth: 280)
                .padding(.bottom, 50)
            }
    }
}

#Preview {
    CardView(honeymoon: honeyMoonData[0])
}
