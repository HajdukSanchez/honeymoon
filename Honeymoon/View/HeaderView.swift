//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 14/01/25.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - Porperties
    
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        HStack {
            Button {
                playSound(name: "sound-click", type: "mp3")
                self.showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            Spacer()
            Button {
                playSound(name: "sound-click", type: "mp3")
                self.showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
        .padding()
    }
}

#Preview {
    HeaderView(showGuideView: .constant(false), showInfoView: .constant(false))
}
