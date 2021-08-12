//
//  OpacityRectangle.swift
//  OpacityRectangle
//
//  Created by Milad Golchinpour on 8/7/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct OpacityRectangle: View {
    var offset: CGFloat
    
    @Environment(\.horizontalSizeClass) var hSizeClass
    
    var body: some View {
        if hSizeClass == .compact {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: getSafeAreaTop())
                .foregroundStyle(.ultraThinMaterial)
                .opacity(offset > -16 ? 0 : 1)
                .animation(.easeIn, value: offset)
        }
    }
}

struct OpacityRectangle_Previews: PreviewProvider {
    static var previews: some View {
        OpacityRectangle(offset: 0)
    }
}
