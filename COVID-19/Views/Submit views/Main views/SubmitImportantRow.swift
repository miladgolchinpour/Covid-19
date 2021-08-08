//
//  SubmitImportantRow.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/3/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct SubmitImportantRow: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack(alignment: .top ,spacing: 20) {
            Image(systemName: image)
                .foregroundColor(.blue)
                .font(.title)
                .padding(.top, 3.5)
            
            Text(text)
        }
    }
}

struct SubmitImportantRow_Previews: PreviewProvider {
    static var previews: some View {
        SubmitImportantRow(image: "facemask", text: "You'll answer a few questions about symptoms and contet you've had with others.")
    }
}
