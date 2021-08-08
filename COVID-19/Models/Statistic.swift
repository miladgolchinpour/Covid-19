//
//  Statistic.swift
//  Statistic
//
//  Created by Milad Golchinpour on 8/8/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation
import SwiftUI

/// Stat type included confirmed, deaths, recovered
enum StatType: String, CaseIterable {
    // Raw values are label texts of stat type
    case confirmed = "Confirmed"
    case deaths = "Deaths"
    case recovered = "Recovered"
}

/// Statistic Model for show stats better in app
struct Statistic: Hashable {
    var type: StatType
    var value: Int
}

// Other data
extension Statistic {
    /// Example Stats for placeholder status
    static var example = [
        Statistic(type: .confirmed, value: 326476233),
        Statistic(type: .deaths, value: 7836427),
        Statistic(type: .recovered, value: 32642)
    ]
}
