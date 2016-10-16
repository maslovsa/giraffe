//
//  MenuController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        self.view.backgroundColor = UIColor.giraffeDarkColor
        
//        self.view.bounds.width = 200.0
        self.tableView.register(UserInfoCell.self, forCellReuseIdentifier: "UserInfoCell")
        self.tableView.register(TextCell.self, forCellReuseIdentifier: "TextCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
//    // MARK: - Table view data source
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Return the number of rows in the section.
//        return 3
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        switch indexPath.row {
//        case 0:
//         let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell", for: indexPath) as! UserInfoCell
//            if let userName = UserDefaults.standard.object(forKey: kFacebookUserNameKey) as? String {
//                cell.cellLabel.text = userName
//            } else {
//                cell.labelText = "войти"
//            }
//            
//            return cell
//        
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
//            cell.labelText = "Задачи"
//            return cell
//        
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
//            cell.labelText = "WOD"
//            return cell
//            
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
//            return cell
//        }
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //
//    }
//
//
}
