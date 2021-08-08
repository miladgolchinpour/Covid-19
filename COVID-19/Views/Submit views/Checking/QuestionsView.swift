//
//  QuestionsView.swift
//  QuestionsView
//
//  Created by Milad Golchinpour on 8/7/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct QuestionsView: View {
    @ObservedObject var questionViewModel: QuestionViewModel
    
    var body: some View {
        QuestionView(questionViewModel: questionViewModel)
            .safeAreaInset(edge: .bottom) {
                if !questionViewModel.showResultView {
                    NextQuestionButton(questionViewModel: questionViewModel)
                }
            }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(questionViewModel: QuestionViewModel())
    }
}
