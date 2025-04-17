//
//  WeatherService.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/13.
//

import Foundation

import Combine
import SwiftUI

class WeatherViewModel: ObservableObject {
    
    private let weatherService = WeatherService()
    
    private var cancellable: AnyCancellable?
    @Published var weather: WeatherResponse?
    
    func fetchWeather(city: String) {
        cancellable = weatherService.getWeather(for: city)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { weather in
                self.weather = weather })
    }
    
    var iconCode: String? {
            return weather?.weather.first?.icon
        }
    var celsius: Double {
        weather?.main.temp ?? 0.0
    }

    
}

struct WeatherIconView: View {
    let iconCode: String

    var body: some View {
        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        } placeholder: {
            ProgressView() // loading
        }
    }
}
