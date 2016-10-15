//
//  BaseTaskCell.swift
//  Giraffe
//
//  Created by Maslov Sergey on 16.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import Foundation

class BaseTaskCell: UITableViewCell {
    var task: TaskItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ task: TaskItem) {
        self.task = task

        updateState()
    }
    
    func updateState() {
        guard let task = task else { return }
        
        if task.isDone {
            self.contentView.backgroundColor = UIColor.giraffeGreenColor
        }
    }
    
}

