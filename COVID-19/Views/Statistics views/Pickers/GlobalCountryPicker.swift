//
//  GlobalCountryPicker.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

enum GlobalCountryPickerSelection: String, CaseIterable {
    case global = "Global"
    case country = "My Country"
}

struct GlobalCountryPicker: View {
    @EnvironmentObject var app: AppSettings
    
    @Environment(\.horizontalSizeClass) var hSizeClass
    
    var widthMinus: CGFloat {
        hSizeClass == .regular ? 200 : 0
    }
    
    var width: CGFloat {
        UIScreen.main.bounds.width - widthMinus
    }
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundStyle(.ultraThinMaterial)
                .frame(width: width/1.3, height: 55)
            
            HStack {
                ForEach(GlobalCountryPickerSelection.allCases, id: \.self) { item in
                    ZStack {
                        Capsule()
                            .frame(width: ((width/1.3)/2)-10, height: 45)
                            .foregroundStyle(app.statSelection == item ? .white : .clear)
                        
                        Text(item.rawValue)
                            .font(.headline)
                            .foregroundColor(app.statSelection == item ? .black : .white)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation { app.statSelection = item }
                            }
                    }
                }
            }
        }
    }
}

struct GlobalCountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            GlobalCountryPicker()
                .environmentObject(AppSettings())
        }
        .preferredColorScheme(.light)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.indigo)
    }
}
