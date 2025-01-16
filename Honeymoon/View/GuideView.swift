//
//  GuideView.swift
//  Honeymoon
//
//  Created by Andrzej Hajduk Sanchez on 16/01/25.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponentView()
                Spacer(minLength: 10)
                Text("Get Started!")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundStyle(.pink)
                Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponentView(
                        title: "Like",
                        subTitle: "Swipe right",
                        description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favorites.",
                        icon: "heart.circle")
                    GuideComponentView(
                        title: "Dismiss",
                        subTitle: "Swipe left",
                        description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                        icon: "xmark.circle")
                    GuideComponentView(
                        title: "Book",
                        subTitle: "Tap the button",
                        description: "Our selection of honeymoon resorts is perfect setting for you to embark your new life together.",
                        icon: "checkmark.square")
                }
                Spacer(minLength: 10)
                Button {
                    
                } label: {
                    Text("Continue".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background {
                            Capsule().fill(.pink)
                        }
                        .foregroundStyle(.white)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    GuideView()
}
