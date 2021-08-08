//
//  COVID_19App.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/29/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

@main
struct COVID_19App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppSettings())
                .environmentObject(API())
        }
    }
}
