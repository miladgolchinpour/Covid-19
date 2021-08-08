//
//  PreventionItem.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Included image and title
struct PreventionItem: View {
    var image: String
    var description: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 400)
            
            Text(description)
                .font(.system(.subheadline, design: .rounded))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .offset(y: -5)
        }
    }
}

struct PreventionItem_Previews: PreviewProvider {
    static var previews: some View {
        PreventionItem(image: "Mask", description: "Wear a face mask")
    }
}
