//
//  TasksTableViewController.swift
//  Giraffe
//
//  Created by Maslov Sergey on 15.10.16.
//  Copyright © 2016 ROKO. All rights reserved.
//


import UIKit

class TasksTableViewController: UITableViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!
    var tasks = [TaskItem]()
    var taskForQR: TaskItem? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        DataManager.sharedInstance.getTasks() { (tasks) in
            self.tasks = tasks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.tasks.count
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let task = tasks[indexPath.row]
//        
//        if task.type == .Math {
//            return 100
//        } else {
//            return 500
//        }
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        if task.type == .Math {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MathCell", for: indexPath) as! MathCell
            cell.configure(task)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QRCell", for: indexPath) as! QRCell
            cell.configure(task)
            cell.delegate = self
            return cell
        }
    }
    
}

extension TasksTableViewController: QRCellProtocol {
    func didClickSearch(cell: QRCell) {
        let controller = MainFabric.getQRViewController()
        self.taskForQR = cell.task
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension TasksTableViewController: QRViewControllerProtocol {
    func didFound(result: String) {
        guard let task = taskForQR else { return}
        
        if let index = tasks.index(where: { $0.id == task.id }) {
            let newTask = tasks[index]
            if newTask.result == result {
                tasks[index].isDone = true
                self.tableView.reloadData()
            }
        }
        
    }
}

