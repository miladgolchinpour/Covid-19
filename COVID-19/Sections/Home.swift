//
//  Home.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 6/30/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Home view
struct Home: View {
    @ObservedObject var network = NetworkMonitor()
    @State private var connection = false
    
    @State private var contentOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView(offsetChanged: { offset in
                contentOffset = offset.y
            }) {
                VStack {
                    HomeCard()
                    
                    PreventionsView()

                    SubmitInviteButton()
                }
                .padding(.bottom, 100)
                .offset(y: -55) // For hide top rounded corners
            }
            .background(Color("Home background"))
            
            OpacityRectangle(offset: contentOffset)
        }
        .ignoresSafeArea()
        .checkForNetwork(connection: $connection, monitor: network)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
