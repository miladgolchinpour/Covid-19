//
//  API.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation
import SwiftUI

/// Access Covid-19 data by country or all global data
class API: ObservableObject {
    // MARK: All Data
    @Published var summary: Summary?
    
    // MARK: Data by Country
    @Published var countries: [Country]?
    
    init() {
        // MARK: Fetch summary data from Api
        URLSession.shared.decode("https://api.covid19api.com/summary") { summary in
            self.summary = summary
        }
    }
    
    /// Access to all global data in a Statistic type array
    func globalData(type: String) -> [Statistic] {
        var allData: [Statistic] = []
        
        if let data = summary?.Global {
            let isTotal: Bool = type == "Total"
            
            let confirmed = isTotal ? data.TotalConfirmed : data.NewConfirmed
            let deaths = isTotal ? data.TotalDeaths : data.NewDeaths
            let recovered = isTotal ? data.TotalRecovered : data.NewRecovered
            
            let stat = [
                Statistic(type: .confirmed, value: confirmed),
                Statistic(type: .deaths, value: deaths),
                Statistic(type: .recovered, value: recovered)
            ]
            
            allData = stat
        }
        
        return allData
    }
    
    /// Access to all countries data in a Statistic type array
    func countriesData(app: AppSettings) -> [Statistic] {
        var allData: [Statistic] = []
        
        if let data = app.country {
            let isTotal: Bool = app.daySelection == "Total"
            
            let confirmed = isTotal ? data.TotalConfirmed : data.NewConfirmed
            let deaths = isTotal ? data.TotalDeaths : data.NewDeaths
            let recovered = isTotal ? data.TotalRecovered : data.NewRecovered
            
            let stat = [
                Statistic(type: .confirmed, value: confirmed),
                Statistic(type: .deaths, value: deaths),
                Statistic(type: .recovered, value: recovered)
            ]
            
            allData = stat
        }
        
        return allData
    }
}
