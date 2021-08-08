//
//  CountrySelection.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// CountrySelection for let user choosing country from menu
struct CountrySelection: View {
    @EnvironmentObject var api: API
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        if let countries = api.summary?.Countries {
            Menu {
                ForEach(countries, id: \.self) { country in
                    Button {
                        appSettings.country = country
                    } label: {
                        Text("\(country.Slug.capitalized)")
                    }
                }
            } label: {
                HStack {
                    Text("\(appSettings.country?.CountryCode ?? "Country")")
                        .foregroundColor(.black)

                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundColor(.indigo)
                        .opacity(0.7)
                }
                .padding()
                .background(.white)
                .cornerRadius(50)
                .contentShape(Rectangle())
            }
        } else {
            Text("Loading...")
                .foregroundColor(.white)
        }
    }
}

struct CountrySelection_Previews: PreviewProvider {
    static var previews: some View {
        CountrySelection()
            .environmentObject(AppSettings())
            .environmentObject(API())
    }
}
