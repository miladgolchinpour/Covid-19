//
//  HomeCard.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Home Top Card included app headline and call to 911 button
struct HomeCard: View {
    @State private var showingCredits = false
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Spacer()
                Button {
                    showingCredits.toggle()
                } label: {
                    Image(systemName: "checkmark.shield")
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain)
            }
            .padding(.top, getSafeAreaTop() + 40)
            
            HStack {
                Text("Covid-19")
                    .foregroundColor(.white)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
                Spacer()
                CountrySelection()
            }
            
            FeelSickSection()
        }
        .padding(30)
        .background(RoundedRectangle(cornerRadius: 40, style: .continuous).fill(.indigo))
        .frame(maxWidth: .infinity, maxHeight: 500)
        .fullScreenCover(isPresented: $showingCredits) {
            CreditsView(showing: $showingCredits)
        }
    }
}

struct HomeCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCard()
    }
}
