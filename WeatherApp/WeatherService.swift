//
//  WeatherService.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/13.
//

import Foundation

import Combine

private enum APIKEY {
    static let key = "85a4a421167ca30b9e47cd268efcc253"
}

class WeatherService{
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeather(for city: String) -> AnyPublisher<WeatherResponse, Error> {
        guard let url = URL(string: "\(baseURL)?q=\(city)&appid=\(APIKEY.key)&units=metric") else {
                    fatalError("Invalid URL")
            
        }
        return URLSession.shared.dataTaskPublisher(for: url)
                    .map { $0.data }
                    .decode(type: WeatherResponse.self, decoder: JSONDecoder())
                    .eraseToAnyPublisher()

    }
    
    
}
