//
//  Weather.swift
//  GoogleMapsTestApp
//
//  Created by Oleksandr Borysenko on 4/18/18.
//  Copyright © 2018 Oleksandr Borysenko. All rights reserved.
//

import Foundation

typealias WeatherData = [String: Any]

struct Weather {
    let description: String
    let temperature: Double
    let windSpeed: Double
    
    init(_ data: WeatherData) {
        self.description = (((data["weather"] as? [Any])?.first as? [String: Any])?["description"]) as? String ?? ""
        self.temperature = (data["main"] as? [String: Any]).flatMap { $0["temp"] as? Double } ?? 0
        self.windSpeed = (data["wind"] as? [String: Any]).flatMap { $0["speed"] as? Double } ?? 0
    }
}
