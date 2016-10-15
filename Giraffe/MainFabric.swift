//
//  MainFabric.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import UIKit

class MainFabric {
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    class func getLandingViewController() -> LoginViewController {
        return storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }
    
    class func getQRViewController() -> QRViewController {
        return storyboard.instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
    }
    
}
