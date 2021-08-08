//
//  NextQuestionButton.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/3/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct NextQuestionButton: View {
    @ObservedObject var questionViewModel: QuestionViewModel
    
    var pageWithCloseButton: Bool {
        questionViewModel.showUnder18View || questionViewModel.showEmergencyView
    }
    
    var correctAnswer: Bool {
        questionViewModel.questions[questionViewModel.questionIndex].selectedItem != nil
    }
    
    var body: some View {
        Button {
            withAnimation {
                if questionViewModel.questionIndex == questionViewModel.questions.endIndex-1 {
                    questionViewModel.showResultView = true
                } else if pageWithCloseButton {
                    questionViewModel.showSubmitSheet = false
                    questionViewModel.resetQuestions()
                } else {
                    if questionViewModel.questions[0].selectedItem == "Yes" {
                        questionViewModel.showEmergencyView = true
                    } else if questionViewModel.questions[1].selectedItem == "Under 18" {
                        questionViewModel.showUnder18View = true
                    } else {
                        questionViewModel.questionIndex += 1
                    }
                }
            }
        } label: {
            Text(pageWithCloseButton ? "Close" : "Next")
                .roundedButtonStyle()
        }
        .disabled(!correctAnswer)
        .opacity(correctAnswer ? 1 : 0.5)
        .background(.bar)
    }
}

struct NextQuestionButton_Previews: PreviewProvider {
    static var previews: some View {
        NextQuestionButton(questionViewModel: QuestionViewModel())
    }
}
