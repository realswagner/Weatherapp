//
//  WeatherService.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/13.
//

import Foundation

import Combine

class WeatherViewModel {
    
    private let weatherService: WeatherService()
    
    private var cancellable: AnyCancellable?
    @Published var weather: WeatherResponse?
    
    func fetchWeather(city: String) {
        cancellable = weatherService.fetchWeather(city: city)
            .ReceiveOn(DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { weather in
                self.weather = weather })
    }
}
