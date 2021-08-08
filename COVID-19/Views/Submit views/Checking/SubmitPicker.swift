//
//  SubmitPicker.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/3/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Included custom items with preferred value
struct SubmitPicker: View {
    var items: [String]
    @Binding var selectedItem: String?
    
    @Environment(\.colorScheme) var theme
    
    var body: some View {
        ForEach(items, id: \.self) { item in
            Button {
                UIImpactFeedbackGenerator().impactOccurred()
                withAnimation {
                    selectedItem = item
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(minHeight: 70)
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .foregroundColor(theme == .dark ? .black : .white)
                        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 0)
                        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.blue, lineWidth: selectedItem == item ? 3 : 0))
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                    HStack {
                        Text(item)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Image(systemName: selectedItem == item ? "checkmark.circle.fill" : "circlebadge")
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                    }
                    .padding(35)
                }
            }
            .buttonStyle(.plain)
            .transition(.opacity)
        }
    }
}

struct SubmitPicker_Previews: PreviewProvider {
    @State static var question1: String? = ""
    
    static var previews: some View {
        SubmitPicker(items: ["Yes"], selectedItem: $question1)
    }
}
