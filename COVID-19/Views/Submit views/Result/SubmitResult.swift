//
//  SubmitResult.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/5/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct SubmitResult: View {
    @ObservedObject var questionViewModel: QuestionViewModel
    
    @EnvironmentObject var app: AppSettings
    
    @Environment(\.colorScheme) var theme
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Completed ✅")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 30)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your result:")
                        .font(.headline)
                    
                    ForEach(questionViewModel.questions) { question in
                        Text("\(question.question.smaller()) \((question.selectedItem ?? "No answer").smaller())")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                
                Text("Continue social distance")
                    .font(.title2)
                    .foregroundColor(.red)
                
                HStack {
                    Button("Share Result") {
                        closeSubmitView()
                        // share results statement here...
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Don't Share") {
                        closeSubmitView()
                        // other statements
                    }
                    .buttonStyle(.bordered)
                }
                .tint(.blue)
                
                Text("We recommend for better helping\nand people health you will share the result.")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .opacity(0.7)
                    .padding()
            }
        }
        .padding()
    }
    
    func closeSubmitView() {
        questionViewModel.showSubmitSheet = false
        questionViewModel.resetQuestions()
    }
}

struct SubmitResult_Previews: PreviewProvider {
    static var previews: some View {
        SubmitResult(questionViewModel: QuestionViewModel())
            .environmentObject(AppSettings())
    }
}
