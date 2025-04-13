//
//  ContentView.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/13.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var city: String = ""
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    private let weatherService = WeatherService()
    var body: some View {
        VStack {
            Text("Enter a City Name to get started!")
                .padding()
                .font(.title)
            TextField(text: $city, prompt: Text("Type City Name here!")){
                Text("City Name")
            }
            .font(.title2)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            Button(action: {
                weatherViewModel.fetchWeather(city: city) // Call the ViewModel's method
            }) {
                Label("Get Weather Data", systemImage: "arrow.down")
            }
            .padding()
            
            if let weather = weatherViewModel.weather {
                Text("Weather in \(weather.name)")
                    .font(.title)
                    .padding()
                
                Text("Temperature: \(weather.main.temp, specifier: "%.1f")°C")
                    .font(.headline)
                    .padding()
                
                Text(weather.weather.first?.description.capitalized ?? "")
                    .font(.subheadline)
            }
        }

            .padding(.bottom, 300)
        }
        
        
    }



#Preview {
    ContentView()
}
