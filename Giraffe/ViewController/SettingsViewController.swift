//
//  SettingsViewController.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import UIKit
import FacebookLogin


class SettingsViewController: BaseRevealViewController {
    //@IBOutlet weak var loginButton: FBSDKButton!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //loginButton.readPermissions = ["public_profile", "email", "user_friends"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
