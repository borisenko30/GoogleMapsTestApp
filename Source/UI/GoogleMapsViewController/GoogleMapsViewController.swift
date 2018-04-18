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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}
