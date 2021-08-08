//
//  SubmitTopCard.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/2/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct SubmitTopCard: View {
    @ObservedObject var questionViewModel: QuestionViewModel
    
    @ObservedObject private var network = NetworkMonitor()
    @State private var connection = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Start answer to\nQuestions")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top, UIApplication.shared.windows[0].safeAreaInsets.top+50)
            
            Text("We ask some easy questions\nfor check your status.")
                .multilineTextAlignment(.center)
                .opacity(0.8)
            
            Button {
                questionViewModel.showSubmitSheet.toggle()
            } label: {
                Text("Start checking")
                    .font(.headline)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
            }
            .disabled(connection)
            .opacity(!connection ? 1 : 0.6)
            .padding(.bottom)
        }
        .padding()
        .foregroundColor(.white)
        .frame(minHeight: 250)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 40, style: .continuous).fill(.indigo))
        .checkForNetwork(connection: $connection, monitor: network)
    }
}

struct SubmitTopCard_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTopCard(questionViewModel: QuestionViewModel())
    }
}
