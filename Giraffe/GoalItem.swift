//
//  Goal.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import Foundation

struct GoalItem {
    var id : String
    var title : String
    var image : String
    var current : Int = 0
    var total : Int = 0
    
    init(id: String, title: String, image : String, current: Int, total: Int) {
        self.id = id
        self.title = title
        self.image = image
        self.current = current
        self.total = total
    }
}
