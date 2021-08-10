//
//  Extensions.swift
//  COVID-19
//
//  Created by Milad Golchinpour on 7/1/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - URL loading system decoder
extension URLSession {
    func decode<T: Codable>(_ url: String, completion: @escaping (T) -> Void) {
        let url = URL(string: url)
        guard let url = url else {
            print("Error: invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    print("Error: load data")
                    return
                }
                guard (response as! HTTPURLResponse).statusCode == 200 else {
                    print("Error: fetch data")
                    return
                }
                guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                    print("Error: decode data")
                    return
                }
                completion(decoded)
            }
        }.resume()
    }
}
// MARK: - New blue rounded button text style
struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .frame(minHeight: 50)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.blue)
            .cornerRadius(13)
            .padding()
    }
}

// MARK: Check for internet connection and if disconnected show error
extension View {
    func checkForNetwork(connection: Binding<Bool>, monitor: NetworkMonitor) -> some View {
        self
            .task {
                if !monitor.isConnected {
                    connection.wrappedValue = true
                } else {
                    connection.wrappedValue = false
                    
                }
            }
            .alert(isPresented: connection) {
                AlertView.network
            }
    }
}

// Create strings smaller for question result better view
extension String {
    /// Smaller String
    func smaller() -> String {
        var string: String = ""
        
        switch self {
        case "Are you tested in last 19 days?":
            string = "Tested?"
        case "Are you have any symptom of these?":
            string = "Symptom:"
        case "Are you've physical contact with anybody in last 14 days?":
            string = "Physical Contact:"
        case "Yes, my result was positive":
            string = "Yes, Positive"
        case "Yes, my result was negative":
            string = "Yes, Negative"
        case "No, i am not tested":
            string = "No"
        case "Yes, i have latest one experiencing":
            string = "Yes"
        case "No, anything similar them":
            string = "No"
        default:
            string = self
        }
        
        return string
    }
}
