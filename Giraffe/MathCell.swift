//
//  MathCell.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import UIKit

class MathCell: UITableViewCell {
    var task: TaskItem?
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var excercise:UILabel!
    @IBOutlet weak var editResult: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(task: TaskItem) {
        self.task = task
        titleLabel.text = task.title
        
        updateState()
    }
    
    func updateState() {
        guard let task = task else { return }

        if task.isDone {
            self.contentView.backgroundColor = UIColor.green
        }
    }
    
    @IBAction func clickCheck(_ sender: AnyObject) {
        guard let task = task else { return }
        
        if let text = editResult.text {
            if text == task.result {
                self.task?.isDone = true
            }
        }
        // TODO:
        updateState()
    }
}

