//
//  Under18.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/3/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct Under18: View {
    @EnvironmentObject var app: AppSettings
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image(systemName: "person.crop.circle.badge.exclamationmark.fill")
                    .font(.system(size: 72))
                    .foregroundColor(.red)
                
                VStack(spacing: 0.0) {
                    Text("Sorry")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("This tool does not support under 18-year persons")
                        .font(.headline)
                }
            }
            .padding(.top, UIApplication.shared.windows[0].safeAreaInsets.top)
        }
    }
}

struct Under18_Previews: PreviewProvider {
    static var previews: some View {
        Under18()
    }
}
