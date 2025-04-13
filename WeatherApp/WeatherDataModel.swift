//
//  APICall.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/13.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Main
    let weather: [Weather]
    let name: String
}

struct Main : Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
