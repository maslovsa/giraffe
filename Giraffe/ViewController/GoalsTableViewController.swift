//
//  NewsTableViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class GoalsTableViewController: UITableViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!
    var goals = [GoalItem]()
    var fakeFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        DataManager.sharedInstance.getGoals { (goals) in
            self.goals = goals
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
        if fakeFlag {
            fakeFlag = false
            goals[0].current = goals[0].current + 1
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
        return self.goals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GoalTableViewCell
        
        let goal = goals[indexPath.row]
        
        cell.goalImageView.image = UIImage(named: goal.image)
        cell.titleLabel.text = goal.title
        cell.progressLabel.text = "\(goal.current) из \(goal.total)"

        
//        DispatchQueue.main.async {
//            cell.goalImageView.layer.cornerRadius = 65
//            cell.goalImageView.clipsToBounds = true
//        }
        return cell
    }
    
}
