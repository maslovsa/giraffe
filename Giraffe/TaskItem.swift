//
//  TaskItem.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import Foundation

enum TaskType: String {
    case Math = "Math"
    case QR = "QR"
}

struct TaskItem {
    var id : String
    var title : String
    var type = TaskType.Math
    var exercise : String
    var result : String
    
    init(id: String, title: String, type : TaskType, exercise: String, result: String) {
        self.id = id
        self.title = title
        self.type = type
        self.exercise = exercise
        self.result = result
    }
}
