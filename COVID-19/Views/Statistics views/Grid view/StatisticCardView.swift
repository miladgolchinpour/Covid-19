//
//  StatisticCardView.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct StatisticCardView: View {
    var statistic: Statistic
    
    var formatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(statistic.type.rawValue)
                .font(.title2)
            
            Spacer(minLength: 45)
            
            let value = statistic.value
            
            Text(value == 0 ? "No data" : formatter.string(from: NSNumber(value: value))!)
                .font(.largeTitle)
                .bold()
        }
        .padding()
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 185, alignment: .leading)
        .background(statistic.type == .confirmed ? .pink : statistic.type == .deaths ? .black : .green)
        .cornerRadius(15)
    }
}

struct StatisticCardView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticCardView(
            statistic: Statistic(
                type: .confirmed,
                value: 102983
            )
        )
    }
}
