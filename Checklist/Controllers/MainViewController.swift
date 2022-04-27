//
//  ViewController.swift
//  Checklist
//
//  Created by Macbook on 4/15/22.
//

import UIKit

class MainViewController: UITableViewController  {
    
    
    let groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Birthdays", imageName: "Birthdays", items: [
            ChecklistItem(isChecked: true, name: "Party")
        ]),
        ChecklistGroup(title: "Groceries", imageName: "Groceries", items: [
            ChecklistItem(isChecked: true, name: "Dog")
        ]),
        ChecklistGroup(title: "To Do", imageName: "Inbox", items: [
            ChecklistItem(isChecked: false, name: "Ballon")
        ]),
        ChecklistGroup(title: "Work", imageName: "Folder", items: [
            ChecklistItem(isChecked: true, name: "Cake")
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
                    vc.items = groups[indexPath.row].items
                    
                    
                }
            }
        }
    }

}
