//
//  ContentView.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/13.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var cityName: String = ""
    var body: some View {
        VStack {
            Text("Enter a City Name to get started!")
                .padding()
                .font(.title)
            TextField(text: $cityName, prompt: Text("Type City Name here!")){
                Text("City Name")
            }
            .font(.title2)
            .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
//            Button(action: apiCall){
//                Label("Look up!", systemImage: "arrow.up")
            }
        .padding(.bottom, 450)
        }
        
    
    }


#Preview {
    ContentView()
}
