//
//  Covid.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/2/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// Covid Model for explain info
struct Covid: Identifiable, Codable {
    var id: Int
    var image: String
    var title: String
    var description: String
}
