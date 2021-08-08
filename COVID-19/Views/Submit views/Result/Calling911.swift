//
//  Calling911.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/3/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct Calling911: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "staroflife.circle.fill")
                        .foregroundColor(.red)
                    
                    Text("You Should Call 911")
                        .bold()
                }
                .font(.largeTitle)
                
                Text("Based on your reported symptoms\n you should seek care immediately.")
                
                Button {
                    let url = URL(string: "tell://911")
                    openURL(url!)
                } label: {
                    HStack {
                        Text("Call 911")
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "phone.fill")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .font(.title3)
                    .roundedButtonStyle()
                }
            }
            .padding(.top, UIApplication.shared.windows[0].safeAreaInsets.top+30)
        }
    }
}

struct Calling911_Previews: PreviewProvider {
    static var previews: some View {
        Calling911()
    }
}
