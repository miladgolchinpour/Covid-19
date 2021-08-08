//
//  Summary.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// Covid summary all data Model
struct Summary: Codable {
    var Global: Global
    var Countries: [Country]
}

/// Covid Global data Model
struct Global: Codable, Hashable {
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var NewDeaths: Int
    var TotalDeaths: Int
    var NewRecovered: Int
    var TotalRecovered: Int
}
