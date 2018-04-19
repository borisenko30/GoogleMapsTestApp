//
//  Weather.swift
//  GoogleMapsTestApp
//
//  Created by Oleksandr Borysenko on 4/18/18.
//  Copyright © 2018 Oleksandr Borysenko. All rights reserved.
//



typealias WeatherData = [String: Any]

//struct Weather {
//    let description: String
//    let temperature: Double
//    let windSpeed: Double
//
//    init(_ data: WeatherData) {
//        self.description = (((data["weather"] as? [Any])?.first as? [String: Any])?["description"]) as? String ?? ""
//        self.temperature = (data["main"] as? [String: Any]).flatMap { $0["temp"] as? Double } ?? 0
//        self.windSpeed = (data["wind"] as? [String: Any]).flatMap { $0["speed"] as? Double } ?? 0
//    }
//}

import Foundation
import Argo
import Runes
import Curry

struct fields {
    static let weather = "weather"
    static let description = "description"
    static let main = "main"
    static let temp = "temp"
    static let wind = "wind"
    static let speed = "speed"
}

struct Weather {
    let description: String
    let temperature: Double
    let windSpeed: Double
}

extension Weather: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<Weather> {
        return curry(Weather.init)
            <^> ((json <|| fields.weather).value?.first ?? .null) <| fields.description
            <*> json <| [fields.main, fields.temp]
            <*> json <| [fields.wind, fields.speed]
    }
}
