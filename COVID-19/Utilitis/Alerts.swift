//
//  Alerts.swift
//  Alerts
//
//  Created by Milad Golchinpour on 8/7/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct AlertView {
    static var network: Alert {
        Alert(title: Text("No internet connection"), message: Text("Please enable Wi-Fi or Cellular"), dismissButton: .cancel(Text("OK")))
    }
}
