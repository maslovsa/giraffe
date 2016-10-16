//
//  BaseTaskCell.swift
//  Giraffe
//
//  Created by Maslov Sergey on 16.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import Foundation

protocol BaseCellProtocol: class {
    func didClickSearch(cell: BaseTaskCell)
    func didUpdateState(cell: BaseTaskCell)    
}

class BaseTaskCell: UITableViewCell {
    var task: TaskItem?
    weak var delegate: BaseCellProtocol?
    
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
    
    func notifyBadAnswer(){
        self.contentView.backgroundColor = UIColor.giraffeLightColor
            
        UIView.animate(withDuration: 0.7, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.contentView.backgroundColor = UIColor.red
            }, completion: { (Bool) -> () in
                UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.contentView.backgroundColor = UIColor.giraffeLightColor
                    }, completion: nil)
        })
    }
}

