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
            let temperature = weatherViewModel.weather?.main.temp ?? 0.0
            let fahrenheit = celsiusToFahrenheit(temperature)
            
            let formattedTemperature = String(format: "%.1f", temperature)
            let formattedFahrenheit = String(format: "%.1f", fahrenheit)
            Text("Enter a City Name!")
                .padding()
                .font(.title)
                .foregroundColor(.blue)
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
            .buttonStyle(.bordered)
            .padding()
            
            
            
            if let weather = weatherViewModel.weather {
                Text("Weather in \(weather.name)")
                    .font(.title)
                    .bold()
                    .padding()
                WeatherCardView(
                    iconName: "thermometer.sun.fill", title: "Temperature",
                    value: "\(formattedTemperature)°C / \(formattedFahrenheit)°F")
                //                Text("Temperature: \(weather.main.temp, specifier: "%.1f")°C / \(celsiusToFahrenheit(weatherViewModel.celsius), specifier: "%.1f")°F")
                //                    .font(.headline)
                //                    .padding()
                WeatherCardView(
                    iconCode: weatherViewModel.iconCode, title: "Today's Forecast",
                    value: weather.weather.first?.description.capitalized ?? "")
            }
            
            //                Text(weather.weather.first?.description.capitalized ?? "")
            //                    .font(.subheadline)
        }
        
        
        .padding(.bottom, 100)
    }
}
        
        
    



#Preview {
    ContentView()
}
