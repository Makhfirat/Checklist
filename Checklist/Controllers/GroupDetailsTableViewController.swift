//
//  GroupDetailsTableViewController.swift
//  Checklist
//
//  Created by Macbook on 4/22/22.
//

import UIKit
//  TODO:
// 1 Отобразить: Создать массив с нашими данными
// 2 



class GroupDetailsTableViewController: UITableViewController {

    var item: [ChecklistItem] = [
        ChecklistItem(isChecked: true, name: "walk the dog"),
        ChecklistItem(isChecked: false, name: "brush the teeth"),
        ChecklistItem(isChecked: true, name: "IOS development"),
        ChecklistItem(isChecked: false, name: "Soccer practice"),
        ChecklistItem(isChecked: true, name: "Eat ice-cream"),
        ChecklistItem(isChecked: true, name: "Dance in the rain")
    
    
    
    ]
        
        
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
        return item.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = item[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) as! ItemsTableViewCell
        cell.noteLabel.text = items.name
        cell.check.isHidden = items.isChecked


        return cell
    }
   

}
