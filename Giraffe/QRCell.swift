//
//  QRCell.swift
//  Giraffe
//
//  Created by Maslov Sergey on 16.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import UIKit

protocol QRCellProtocol: class {
    func didClickSearch(cell: QRCell)
}

class QRCell: BaseTaskCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var excercise:UILabel!
    weak var delegate: QRCellProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configure(_ task: TaskItem) {
        super.configure(task)
        titleLabel.text = task.title
        excercise.text = task.exercise
    }
    
    @IBAction func clickCheck(_ sender: AnyObject) {
        guard let task = task else { return }
        delegate?.didClickSearch(cell: self)
    }
}


