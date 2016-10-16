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
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        for view in self.view.subviews {
            if let inputView = view as? UITextField {
                inputView.resignFirstResponder()
            }
        }
    }
    
    func checkTasks() {
        if tasks.filter({ $0.isDone}).count == tasks.count {
           showCongrats()
        }
    }
    
    func showCongrats() {
        let alert = UIAlertController(title: "Поздравляем", message: "Выполнено задание", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ура!", style: .default, handler: { (action) in
            let controller = MainFabric.getGoalsTableViewController()
            controller.fakeFlag = true
            let navigationVC = UINavigationController(rootViewController: controller)
            navigationVC.setViewControllers([controller], animated: true)
            self.revealViewController().pushFrontViewController(navigationVC, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let task = tasks[indexPath.row]
        
        return task.isDone ? 59.0 : 100.0
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.dismissKeyboard()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismissKeyboard()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        if task.type == .Math {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MathCell", for: indexPath) as! MathCell
            cell.configure(task)
            cell.delegate = self
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QRCell", for: indexPath) as! QRCell
            cell.configure(task)
            cell.delegate = self
            return cell
        }
    }
    
}

extension TasksTableViewController: BaseCellProtocol {
    
    func didClickSearch(cell: BaseTaskCell) {
        let controller = MainFabric.getQRViewController()
        self.taskForQR = cell.task
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func didUpdateState(cell: BaseTaskCell) {
        guard let task = cell.task else { return}

        if let index = tasks.index(where: { $0.id == task.id }) {
            tasks[index] = task
            self.dismissKeyboard()
            self.checkTasks()
            self.tableView.reloadData()
        }
    }

}

extension TasksTableViewController: QRViewControllerProtocol {
    func didFound(result: String) {
        guard let task = taskForQR else { return}
        
        if let index = tasks.index(where: { $0.id == task.id }) {
            let newTask = tasks[index]
            if newTask.result == result {
                tasks[index].isDone = true
                self.checkTasks()
                self.dismissKeyboard()
                self.tableView.reloadData()
            }
        }
        
    }
}

