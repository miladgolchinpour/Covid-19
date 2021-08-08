//
//  Submit.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/2/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// User personal submit view
struct Submit: View {
    @EnvironmentObject var app: AppSettings
    @State private var contentOffset: CGFloat = 0
    
    @StateObject private var questionViewModel = QuestionViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView(offsetChanged: { offset in
                contentOffset = offset.y
            }) {
                VStack {
                    SubmitTopCard(questionViewModel: questionViewModel)
                    
                    VStack(alignment: .leading ,spacing: 30) {
                        Text("Important")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.top)
                        
                        ForEach(importantItems, id: \.self) {
                            SubmitImportantRow(image: $0.image, text: $0.text)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 100)
                    .padding()
                }
                .offset(y: -55) // For hide top rounded corners
            }
            
            OpacityRectangle(offset: contentOffset)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $questionViewModel.showSubmitSheet) {
            QuestionsView(questionViewModel: questionViewModel)
        }
    }
    
    struct Important: Hashable {
        var image: String
        var text: String
    }
    
    var importantItems: [Important] = [
        Important(image: "list.number", text: "You'll answer a few questions about symptoms and content you've had with others."),
        Important(image: "hand.raised.fill", text: "Your answers will not be shared with this app developers without your permission."),
        Important(image: "checkmark.circle.fill", text: "By using this tool, you agree to its terms and this app developer will not be liable for any harm relating to your use.")
    ]
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
