//
//  ViewController.swift
//  Checklist
//
//  Created by Macbook on 4/15/22.
//

import UIKit

class MainViewController: UITableViewController  {
    
    
    var groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Birthdays", imageName: "Birthdays", items: [
            ChecklistItem(isChecked: false, name: "Party", remindMe: true, dueDate: Date())
        ]),
        ChecklistGroup(title: "Groceries", imageName: "Groceries", items: [
            ChecklistItem(isChecked: true, name: "Dog", remindMe: true, dueDate: Date())
        ]),
        ChecklistGroup(title: "To Do", imageName: "Inbox", items: [
            ChecklistItem(isChecked: false, name: "Ballon", remindMe: false, dueDate: nil)
        ]),
        ChecklistGroup(title: "Work", imageName: "Folder", items: [
            ChecklistItem(isChecked: true, name: "Cake", remindMe: true, dueDate: Date())
        ])
    ]
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToGroupDetails" {
            if let vc = segue.destination as? GroupDetailsTableViewController  {
                if let indexPath = tableView.indexPathForSelectedRow {
                    vc.title = groups[indexPath.row].title
                    vc.items = groups[indexPath.row].items
                    
                    
                }
            }
        }
    }

}
