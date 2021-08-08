//
//  Info.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/2/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Covid-19 information and FAQ view
struct Info: View {
    // Decoding json file with bundle decodable utility
    @State private var covidInfo: [Covid] = Bundle.main.decode("covidInfo.json")
    
    @State private var contentOffset: CGFloat = 0
    
    // Colors of per card icon image color
    let colors: [Color] = [.orange, .green, .indigo, .purple, .pink]
    
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView { offset in
                self.contentOffset = offset.y
            } content: {
                VStack(spacing: 20) {
                    InfoHeadline()
                        .padding(.top, 20) // Additional padding from top
                    
                    ForEach(covidInfo) { covid in
                        InfoCard(
                            image: covid.image,
                            title: covid.title,
                            description: covid.description,
                            color: colors[covid.id % covidInfo.count]
                        )
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 150)
            }
            
            OpacityRectangle(offset: contentOffset)
        }
        .background(.indigo)
        .ignoresSafeArea()
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info()
    }
}
