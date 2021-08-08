//
//  Sidebar.swift
//  Sidebar
//
//  Created by Milad Golchinpour on 8/7/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Home()) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: Statistics()) {
                    Label("Statistics", systemImage: "chart.bar.xaxis")
                }
                NavigationLink(destination: Submit()) {
                    Label("Submit", systemImage: "person")
                }
                NavigationLink(destination: Info()) {
                    Label("Info", systemImage: "info.circle")
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("COVID-19")
            
            Home()
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
