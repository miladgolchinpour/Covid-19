//
//  Question.swift
//  Question
//
//  Created by Milad Golchinpour on 8/7/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// Question Model for get user personal covid data
struct Question: Identifiable, Codable {
    var id: Int
    var question: String
    var submitItems: [String]
    var selectedItem: String?
    var image: String?
    var descriptionItems: [String]?
}

// For previews
extension Question {
    /// Example simple question
    static var example = Question(
        id: 1, question: "Is this an emergency?",
        submitItems: ["Yes", "No"],
        image: "staroflife.circle.fill",
        descriptionItems: [
            "Severe, constant chest pain or pressure",
            "Extreme difficulty breathing",
            "Severe, constant lightheadedness",
            "Serious disorientation or unresponsiveness",
            "Blue-tinted face or lips"
        ]
    )
}
