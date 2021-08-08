//
//  InfoCard.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/2/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Card Style rectangle for showing an information of covid
struct InfoCard: View {
    @Environment(\.colorScheme) var theme
    
    var image: String
    var title: String
    var description: String
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .foregroundColor(theme == .dark ? .black.opacity(0.85) : .white)
                .frame(maxWidth: .infinity, maxHeight: 800)
                .shadow(color: theme == .light ? .black.opacity(0.25) : .clear, radius: 15, x: 5, y: 5)
            
            HStack(alignment: .top) {
                VStack {
                    Image(systemName: image)
                        .foregroundColor(color)
                        .font(.title2)
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(description)
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoCard(image: "facemask", title: "Title", description: "Des", color: .blue)
    }
}
