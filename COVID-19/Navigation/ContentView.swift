//
//  ContentView.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/29/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    
    var body: some View {
        if hSizeClass == .compact {
            TabBar()
        } else {
            Sidebar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
