//
//  InfoView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 20/01/25.
//

import SwiftUI

struct InfoView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismissSheet
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponentView()
                Spacer(minLength: 10)
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                AppInfoView()
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                CreditsInfoView()
                Spacer(minLength: 10)
                Button {
                    self.dismissSheet()
                } label: {
                    Text("Continue".uppercased())
                }
                .modifier(ButtonModifier())
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    InfoView()
}

// MARK: - AppInfoView
private struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Develoepr", itemTwo: "Jozek Hajduk")
            RowAppInfoView(itemOne: "Designer", itemTwo: "Robert Petras")
            RowAppInfoView(itemOne: "Website", itemTwo: "swiftuimasterclass.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        }
    }
}

// MARK: - CreditsInfoView
private struct CreditsInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack {
                Text("Photos")
                    .foregroundStyle(.gray)
                Spacer()
                Text("Unsplash")
            }
            Divider()
            Text("Photographers")
                .foregroundStyle(.gray)
            Text(photographers)
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
    }
}

// MARK: - RowAppInfoView
private struct RowAppInfoView: View {
    
    // MARK: - Properties
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Text(itemOne)
                    .foregroundStyle(.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

// MARK: - Photographers variable
private var photographers = "Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)"
