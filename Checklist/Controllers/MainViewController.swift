//
//  ViewController.swift
//  Checklist
//
//  Created by Macbook on 4/15/22.
//

import UIKit

class MainViewController: UITableViewController  {
    
    
    let groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Birthdays", imageName: "birthdaypic"),
        ChecklistGroup(title: "Groceries", imageName: "groceriespic"),
        ChecklistGroup(title: "To Do", imageName: "todopic"),
        ChecklistGroup(title: "Work", imageName: "workpic")]


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
        
        cell.titleLabel.text = group.title
        return cell 
    }
}

