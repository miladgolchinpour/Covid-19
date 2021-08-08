//
//  SubmitInviteView.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Button for inviting user to submit personal covid data
struct SubmitInviteButton: View {
    @EnvironmentObject var app: AppSettings
    
    var body: some View {
        Button {
            app.tab = .submit
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Do your own test!")
                        .font(.headline)
                    
                    Text("Tap here to\ndo your own test.")
                        .font(.caption)
                        .opacity(0.8)
                }
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                
                Spacer()
                
                Image("Test")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 180)
            }
            .padding(.horizontal)
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [.indigo, .indigo.opacity(0.5)], startPoint: .trailing, endPoint: .leading)))
            .frame(maxWidth: .infinity, maxHeight: 120)
            .padding()
        }
    }
}

struct SubmitInviteButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitInviteButton()
            .environmentObject(AppSettings())
    }
}
