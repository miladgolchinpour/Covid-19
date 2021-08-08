//
//  QuestionViewModel.swift
//  QuestionViewModel
//
//  Created by Milad Golchinpour on 8/7/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// Shared published vars between Submit views
class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = Bundle.main.decode("questions.json")
    @Published var questionIndex: Int = 0
    @Published var showSubmitSheet = false
    @Published var showResultView = false
    @Published var showUnder18View = false
    @Published var showEmergencyView = false
    
    /// Reset submit questions data
    func resetQuestions() {
        showResultView = false
        showUnder18View = false
        showEmergencyView = false
        questionIndex = 0
        
        // Set all question selectedItem variables to nil again
        for (index, var item) in questions.enumerated() {
            item.selectedItem = nil
            questions[index] = item
        }
    }
}
