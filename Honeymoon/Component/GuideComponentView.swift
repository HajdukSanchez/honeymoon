//
//  GuideComponentView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 16/01/25.
//

import SwiftUI

struct GuideComponentView: View {
    
    // MARK: - Properties
    
    var title: String
    var subTitle: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(.pink)
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subTitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundStyle(.pink)
                }
                Divider().padding(.bottom, 4)
                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    GuideComponentView(
        title: "Title",
        subTitle: "Sub title",
        description: "Description Description Description Description Description Description Description ",
        icon: "heart.circle"
    )
}
