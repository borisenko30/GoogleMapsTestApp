//
//  WeatherProvider.swift
//  GoogleMapsTestApp
//
//  Created by Oleksandr Borysenko on 4/18/18.
//  Copyright © 2018 Oleksandr Borysenko. All rights reserved.
//

import Foundation
import Alamofire
import GoogleMaps
import Argo

typealias WeatherCompletion = (Argo.JSON) -> ()

class WeatherProvider {
    func fetchWeather(_ location: CLLocationCoordinate2D, completion: WeatherCompletion? = nil) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather") else { return }
        
        Alamofire.request(
            url,
            method: .get,
            parameters: ["lat": location.latitude, "lon": location.longitude, "APPID" : "314bee97e600db3628d19c31cd0d9d76"])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching weather data: \(String(describing: response.result.error))")
                    return
                }
 
                guard let value = response.result.value as? [String: Any] else {
                        print("Malformed data received from openweather service")
                        
                        return
                }

                completion?(Argo.JSON(value))
            }
    }
}
