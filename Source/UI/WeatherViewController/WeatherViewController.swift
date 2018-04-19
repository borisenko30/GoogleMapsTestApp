//
//  WeatherViewController.swift
//  GoogleMapsTestApp
//
//  Created by Oleksandr Borysenko on 4/19/18.
//  Copyright © 2018 Oleksandr Borysenko. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let model: Weather
    
    // MARK: - Initializations and deinit
    
    init(_ model: Weather) {
        self.model = model
        
        super.init(nibName: "WeatherViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        (self.view as? WeatherView)?.fill(with: model)
    }
    
    // MARK: - Public methods
    
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
