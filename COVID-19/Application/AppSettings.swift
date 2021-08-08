//
//  AppSettings.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation
import SwiftUI

/// Shared variables between all views
class AppSettings: ObservableObject {
    // MARK: Main tab
    @Published var tab: TabSelection = .home
    
    // MARK: Selected Country by user
    @Published var country: Country? {
        didSet {
            if let encoded = try? JSONEncoder().encode(country) {
                UserDefaults.standard.set(encoded, forKey: "savedCountry")
            }
        }
    }
    
    // MARK: Internet
    @Published var networkError = false
    
    // MARK: Day picker selection
    @Published var daySelection = "Total"
    @Published var statSelection: GlobalCountryPickerSelection = .global
    
    init() {
        // for set country variable
        if let data = UserDefaults.standard.data(forKey: "savedCountry") {
            if let decoded = try? JSONDecoder().decode(Country?.self, from: data) {
                country = decoded
            }
        }
    }
}
