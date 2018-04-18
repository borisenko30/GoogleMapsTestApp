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
    
    typealias Coordinates = (latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        let coordinates = self.randomCoordinates()
        let mapView = self.createMap(coordinates: coordinates)

        self.putMarker(on: mapView, coordinates: coordinates)
        self.view = mapView
        
        self.view.addSubview(self.randomButton())
    }
    
    // MARK: - Private methods
    
    private func createMap(coordinates: Coordinates) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        
        return mapView
    }
    
    private func putMarker(on view: GMSMapView, coordinates: Coordinates) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
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
        let coordinates = self.randomCoordinates()

        guard let mapView = self.view as? GMSMapView else { return }
        
        let target = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        mapView.camera = GMSCameraPosition.camera(withTarget: target, zoom: 6)
        
        self.putMarker(on: mapView, coordinates: coordinates)
    }
    
    private func randomCoordinates() -> Coordinates {
        return (.random(min: -90, max: 90), .random(min: -180, max: 180))
    }
}
