//
//  GoogleMapsViewController.swift
//  GoogleMapsTestApp
//
//  Created by Oleksandr Borysenko on 4/18/18.
//  Copyright © 2018 Oleksandr Borysenko. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        let location = self.randomLocation()
        let mapView = self.createMap(location: location)

        self.putMarker(on: mapView, location: location)
        self.view = mapView
        
        self.view.addSubview(self.randomButton())
    }
    
    // MARK: - Private methods
    
    private func createMap(location: CLLocationCoordinate2D) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withTarget: location, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
        return mapView
    }
    
    private func putMarker(on view: GMSMapView, location: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = location
        marker.map = view
    }
    
    private func randomButton() -> UIButton {
        let button = UIButton()
        button.setTitle(" Random Place ", for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.frame.origin.y += 40
        button.frame.origin.x += 20
        button.sizeToFit()
        button.addTarget(self, action: #selector(onRandom), for: .touchUpInside)
        
        return button
    }
    
    @objc private func onRandom() {
        guard let mapView = self.view as? GMSMapView else { return }
        let location = self.randomLocation()
        
        mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom: 6)
        
        self.putMarker(on: mapView, location: location)
    }
    
    private func randomLocation() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: .random(min: -90, max: 90), longitude: .random(min: -180, max: 180))
    }
}

// MARK: - GMSMapViewDelegate

extension GoogleMapsViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let position = marker.position
        WeatherProvider().fetchWeather(position) { data in
            Weather.decode(data).value.map {
                self.present(WeatherViewController($0), animated: true)
            }
        }
        
        return true
    }
}
