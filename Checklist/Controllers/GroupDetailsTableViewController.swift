//
//  GroupDetailsTableViewController.swift
//  Checklist
//
//  Created by Macbook on 4/22/22.
//

import UIKit
//  TODO:
// 1 Отобразить: Создать массив с нашими данными



class GroupDetailsTableViewController: UITableViewController {
    
    var group: ChecklistGroup!
    var delegate: GroupDetailsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return group.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = group.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) as! ItemsTableViewCell
        cell.noteLabel.text = item.name
        cell.check.isHidden = item.isChecked
        
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "GroupDetailsToItemDetails",
           let vc = segue.destination as? AddItemTableViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            vc.title = "Edit Item"
            vc.item = group.items[indexPath.row]
            //items[indexPath.row].name
            
        }
        
    }
    //MARK: - processing of delegation of table or UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap on cage \(indexPath.row)")
    }
    
    override func tableView(_ tableView : UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // delete the info from array
        group.items.remove(at: indexPath.row)
        // delete the cell from table
        tableView.deleteRows(at: [indexPath], with: .automatic )
    }
}
