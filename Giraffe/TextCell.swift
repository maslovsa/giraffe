//
//  TextCell.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

class TextCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    var labelText: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //cellLabel.text = labelText
        
        let view = UIView()
        view.backgroundColor = UIColor.giraffeLightColor
        selectedBackgroundView = view
    }
    
}
