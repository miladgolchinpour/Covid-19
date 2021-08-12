//
//  InfoHeadline.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/2/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct InfoHeadline: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("About COVID-19")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.semibold)
            
            Text("An up-to-date rundown of the virus and\nits symptoms")
                .font(.title3)
        }
        .foregroundColor(.white)
        .padding(.top, getSafeAreaTop() + 20)
        .padding(.leading, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct InfoHeadline_Previews: PreviewProvider {
    static var previews: some View {
        InfoHeadline()
    }
}
