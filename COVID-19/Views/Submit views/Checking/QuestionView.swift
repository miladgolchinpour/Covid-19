//
//  QuestionView.swift
//  QuestionView
//
//  Created by Milad Golchinpour on 8/7/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var app: AppSettings
    
    @ObservedObject var questionViewModel: QuestionViewModel
    
    var currentQuestion: Question {
        questionViewModel.questions[questionViewModel.questionIndex]
    }
    
    var body: some View {
        if questionViewModel.showResultView {
            SubmitResult(questionViewModel: questionViewModel)
        } else if questionViewModel.showEmergencyView {
            Calling911()
        } else if questionViewModel.showUnder18View {
            Under18()
        } else {
            VStack {
                // App Top Bar Buttons
                HStack {
                    if !(questionViewModel.questionIndex == 0) {
                        Button("Back") {
                            withAnimation {
                                questionViewModel.questionIndex -= 1
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button("Cancel") {
                        questionViewModel.showSubmitSheet = false
                        questionViewModel.resetQuestions()
                    }
                }
                .padding()
                
                ScrollView {
                    // Question Text and optional Image
                    HStack(spacing: 10) {
                        if let image = currentQuestion.image {
                            Image(systemName: image)
                                .foregroundColor(.red)
                        }
                        
                        Text(currentQuestion.question)
                            .bold()
                        
                        Spacer()
                    }
                    .font(.largeTitle)
                    .padding()
                    
                    // Question optional description
                    if let descriptionItems = currentQuestion.descriptionItems {
                        VStack(alignment: .leading, spacing: 10.0) {
                            ForEach(descriptionItems, id: \.self) {
                                Text("- \($0)")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                    
                    // Question submit items
                    VStack {
                        SubmitPicker(items: currentQuestion.submitItems, selectedItem: $questionViewModel.questions[questionViewModel.questionIndex].selectedItem)
                    }
                    .padding(.top, 30)
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(questionViewModel: QuestionViewModel())
    }
}
