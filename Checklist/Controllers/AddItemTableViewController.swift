//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Macbook on 4/25/22.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    var item:ChecklistItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if let item = item {
            if  item.remindMe {
                return 3
            }else{
                return 2
            }
        }else{
            return 3
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextFieldTableViewCell
            if let item = item {
//                cell.textField.text = item.name
                cell.addTextField.text = item.name
            }
            return cell
        } else if indexPath.section ==  1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SwitchTableViewCell
            cell.switch.setOn(item?.remindMe ?? false, animated: true)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateTableViewCell
            if let item = item, let date = item.dueDate {
                cell.Date.setDate(date, animated: true)
            }
            return cell


        }
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    

}
