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
        let goalB = GoalItem(id: "1", title: "Супер путешествие", image : "map", current: 10, total: 20)
        goals = [goalA, goalB]
        
        completion(goals)

    }
    
    func getTasks(completion: ([TaskItem]) -> Void) {
        
        let task1 = TaskItem(id: "0", title: "Реши меня", type : .Math, exercise: "2+2", result: "4")
        let task2 = TaskItem(id: "1", title: "А сколько будет", type : .Math, exercise: "2*2", result: "4")
        let task3 = TaskItem(id: "2", title: "А вот примерчик", type : .Math, exercise: "5-1", result: "4")
        let task4 = TaskItem(id: "3", title: "Решишь?", type : .Math, exercise: "1+1+1+1", result: "4")
        let task5 = TaskItem(id: "4", title: "Поиск QR кода", type : .QR, exercise: "Уберись в комнате и найди код", result: "player4")
        
        tasks = [task1, task2, task3, task4, task5]
        
        completion(tasks)
        
    }
}

