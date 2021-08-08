//
//  Country.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// Covid by Country Model
struct Country: Codable, Hashable {
    var Country: String
    var CountryCode: String
    var Slug: String
    var NewConfirmed: Int
    var NewDeaths: Int
    var NewRecovered: Int
    var TotalConfirmed: Int
    var TotalDeaths: Int
    var TotalRecovered: Int
}
