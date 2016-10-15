//
//  DataManager.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//

import UIKit

class DataManager {
    static let sharedInstance : DataManager = {
        let instance = DataManager()
        return instance
    }()
    
    var goals = [GoalItem]()
    var tasks = [TaskItem]()
    
    fileprivate init() {
//        goals = [GoalItem]()
    }
    
    
    func getGoals(completion: ([GoalItem]) -> Void) {
        
        let goalA = GoalItem(id: "0", title: "Супер газета", image : "news", current: 3, total: 10)
        let goalB = GoalItem(id: "0", title: "Супер путешествие", image : "map", current: 10, total: 20)
        goals = [goalA, goalB]
        
        completion(goals)

    }
    
    func getTasks(completion: ([TaskItem]) -> Void) {
        
        let taskA = TaskItem(id: "0", title: "Реши меня", type : .Math, exercise: "2+2", result: "4")
        let taskB = TaskItem(id: "1", title: "Уберись в комнате и найди код", type : .QR, exercise: "", result: "player4")
        
        tasks = [taskA, taskB]
        
        completion(tasks)
        
    }
}

