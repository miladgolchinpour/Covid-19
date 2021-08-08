//
//  DayPicker.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct DayPicker: View {
    @EnvironmentObject var app: AppSettings
    
    let items = ["Total", "Today"]
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(items, id:\.self) { item in
                Button{
                    withAnimation {
                        app.daySelection = item
                    }
                } label: {
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.white)
                        .opacity(app.daySelection == item ? 1 : 0.6)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}

struct DayPicker_Previews: PreviewProvider {
    static var previews: some View {
        DayPicker()
            .environmentObject(AppSettings())
    }
}
