//
//  StatisticsHeadline.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct StatisticsHeadline: View {
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            HStack {
                Text("Statistics")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 2) {
                GlobalCountryPicker()
                
                DayPicker()
            } 
        }
        .padding()
        .padding(.top, getSafeAreaTop() + 10)
    }
}

struct StatisticsHeadline_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsHeadline()
            .background(.indigo)
    }
}
