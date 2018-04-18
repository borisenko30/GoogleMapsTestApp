//
//  FacebookProvider.swift
//  GoogleMapsTestApp
//
//  Created by Oleksandr Borysenko on 4/18/18.
//  Copyright © 2018 Oleksandr Borysenko. All rights reserved.
//

import FBSDKCoreKit
import FBSDKLoginKit

typealias Completion = () -> ()

class FacebookProvider {
    
    func login(_ completionHandler: Completion? = nil) {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["email"], from: nil) { (result, error) in
            if error == nil, result?.grantedPermissions?.contains("email") == true {
                completionHandler?()
            }
        }
    }
    
    func logout(_ completionHandler: Completion? = nil) {
        FBSDKLoginManager().logOut()
        completionHandler?()
    }
}
