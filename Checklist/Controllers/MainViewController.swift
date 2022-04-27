//
//  ViewController.swift
//  Checklist
//
//  Created by Macbook on 4/15/22.
//

import UIKit

class MainViewController: UITableViewController  {
    
    
    let groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Birthdays", imageName: "Birthdays"),
        ChecklistGroup(title: "Groceries", imageName: "Groceries"),
        ChecklistGroup(title: "To Do", imageName: "Inbox"),
        ChecklistGroup(title: "Work", imageName: "Folder")]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let group = groups[indexPath.row]
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.iconView.image = UIImage(named: group.imageName)
        cell.titleLabel.text = group.title
        return cell 
    }
}

