//
//  StatisticsView.swift
//  StatisticsView
//
//  Created by Milad Golchinpour on 8/8/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var app: AppSettings
    @EnvironmentObject var api: API
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 350), spacing: 15)], spacing: 15) {
            if api.summary != nil {
                if app.statSelection == .global {
                    ForEach(api.globalData(type: app.daySelection), id: \.self) { stat in
                        StatisticCardView(statistic: stat)
                    }
                } else {
                    if app.country == nil {
                        Text("Select your country\nin home screen")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title)
                            .multilineTextAlignment(.center)
                    } else {
                        ForEach(api.countriesData(app: app), id: \.self) { stat in
                            StatisticCardView(statistic: stat)
                        }
                    }
                }
            } else {
                ForEach(Statistic.example, id: \.self) {
                    StatisticCardView(statistic: $0)
                        .redacted(reason: .placeholder)
                }
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
            .environmentObject(AppSettings())
            .environmentObject(API())
    }
}
