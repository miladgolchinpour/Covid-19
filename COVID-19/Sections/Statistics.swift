//
//  Statistics.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Statistics view
struct Statistics: View {
    @EnvironmentObject var AppApi: API
    @EnvironmentObject var appSettings: AppSettings
    
    @ObservedObject var network = NetworkMonitor()
    @State private var connection = false
    
    @State private var contentOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView(offsetChanged: { offset in
                contentOffset = offset.y
            }) {
                VStack {
                    StatisticsHeadline()
                    
                    StatisticsView()
                }
                .padding()
                .padding(.bottom, 100)
            }
            .background(Color.indigo)
            
            OpacityRectangle(offset: contentOffset)
        }
        .ignoresSafeArea()
        .checkForNetwork(connection: $connection, monitor: network)
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
