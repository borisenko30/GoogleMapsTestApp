//
//  ViewController.swift
//  GoogleMapsTestApp
//
//  Created by Oleksandr Borysenko on 4/17/18.
//  Copyright © 2018 Oleksandr Borysenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func onLogin(sender: UIButton) {
        FacebookProvider().login()
    }
}
