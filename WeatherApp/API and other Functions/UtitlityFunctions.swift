//
//  UtitlityFunctions.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/17.
//

import Foundation



//converts celsius(weather.main.temp) defined in weatherview to fahrenheit
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}
