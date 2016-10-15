//
//  UserInfoCell.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//
import UIKit


class UserInfoCell: MainMenuCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let userName = UserDefaults.standard.object(forKey: kFacebookUserNameKey) as? String {
            cellLabel.text = userName
        } else {
            cellLabel.text = "Войти"
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

