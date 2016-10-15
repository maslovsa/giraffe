//
//  UserInfoCell.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//
import UIKit


class UserInfoCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    var labelText: String = ""
    var imageName: String? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellLabel.text = labelText
        if imageName != nil {
            cellImage.image = UIImage(named: imageName!)
        }
        
        let view = UIView()
        view.backgroundColor = UIColor.giraffeLightColor
        selectedBackgroundView = view
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
