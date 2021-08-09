//
//  CreditsView.swift
//  CreditsView
//
//  Created by Milad Golchinpour on 8/8/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct CreditsView: View {
    @Binding var showing: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section("RESTful Api") {
                    Text("https://api.covid19api.com/")
                }
                
                Section("Data resource") {
                    Text("Apple Covid-19 Application")
                }
            
                Section("User interface") {
                    Link("Covid-19-App-Free", destination: URL(string: "https://dribbble.com/shots/11015463-Covid-19-App-Free")!)
                }
                
                Section("Notes") {
                    Text(notes)
                }
                
                Section("License") {
                    Text(license)
                        .lineLimit(nil)
                }
            }
            .navigationTitle("Credits")
            .toolbar {
                Button("Close") {
                    showing.toggle()
                }
            }
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView(showing: .constant(true))
    }
}

var notes = """
This is a sample app and has not been created for real usage\n
Developed by Milad Golchinpour

Copyright © 2021 Milad Golchinpour. All rights reserved.
"""

var license = """
MIT License

Copyright (c) 2021 Milad Golchinpour

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""
