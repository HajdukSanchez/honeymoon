//
//  FooterView.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 16/01/25.
//

import SwiftUI

struct FooterView: View {
    
    // MARK: - Properties
    
    @Binding var showBookingAlert: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            Spacer()
            Button {
                self.showBookingAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .tint(.pink)
                    .background {
                        Capsule()
                            .stroke(.pink, lineWidth: 2)
                    }
            }

            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

#Preview {
    FooterView(showBookingAlert: .constant(false))
}
