//
//  FeelSickSection.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// FeelSickSection view will be show a simple text and call to 911 button
struct FeelSickSection: View {
    // phone call
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Are you feeling sick?")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("if you feel sick with any of *covid-19* symptoms please call or SMS us immediately for help.")
                .foregroundColor(.white)
                .opacity(0.8)
                .font(.subheadline)
            
            HStack {
                Button {
                    makeEmergencyCall(number: "911")
                } label: {
                    Label("Call Now", systemImage: "phone.fill")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(.red)
                        .cornerRadius(50)
                }
                
                Spacer()
            }
            .truncationMode(.middle)
            .padding(.top)
        }
    }
    
    func makeEmergencyCall(number: String) {
        let phone = "tel://\(number)"
        guard let url = URL(string: phone) else { return }
        openURL(url)
    }
}

struct FeelSickSection_Previews: PreviewProvider {
    static var previews: some View {
        FeelSickSection()
    }
}
