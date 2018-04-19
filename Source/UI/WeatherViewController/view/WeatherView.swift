//
//  WeatherView.swift
//  GoogleMapsTestApp
//
//  Created by Oleksandr Borysenko on 4/19/18.
//  Copyright © 2018 Oleksandr Borysenko. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    
    func fill(with model: Weather) {
        self.descriptionLabel.text = "Weather description: \(model.description)"
        self.temperatureLabel.text = "Temperature: \(model.temperature) K"
        self.windSpeedLabel.text = "Wind speed: \(model.windSpeed) m/s"
    }
}
