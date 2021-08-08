//
//  TabBar.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

enum TabSelection {
    case home, statistic, submit, info
}

struct TabBar: View {
    @EnvironmentObject var app: AppSettings
    
    var body: some View {
        TabView(selection: $app.tab) {
            Home()
                .tag(TabSelection.home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Statistics()
                .tag(TabSelection.statistic)
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar.xaxis")
                }
            
            Submit()
                .tag(TabSelection.submit)
                .tabItem {
                    Label("Submit", systemImage: "person")
                }
            
            Info()
                .tag(TabSelection.info)
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
        }

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(AppSettings())
    }
}
