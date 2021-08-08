//
//  PreventionsView.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Just 3 Prevention for covid 19
struct PreventionsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Prevention")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            // All Preventions
            let count = CGFloat(preventions.count)
            HStack(spacing: (UIScreen.main.bounds.width/(count*count)/2)) {
                ForEach(preventions, id: \.self) {
                    PreventionItem(image: $0.image, description: $0.text)
                }
            }
        }
        .padding(.top)
    }
    
    struct Prevention: Hashable {
        var image: String
        var text: String
    }
    
    var preventions: [Prevention] = [
        Prevention(image: "Close", text: "Avoid close\ncontact"),
        Prevention(image: "Wash", text: "Clean your\nhands often"),
        Prevention(image: "Home", text: "Stay at\nhome")
    ]
}

struct PreventionsView_Previews: PreviewProvider {
    static var previews: some View {
        PreventionsView()
    }
}
