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

    var items: [ChecklistItem] = []
        
        
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
        return items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) as! ItemsTableViewCell
        cell.noteLabel.text = item.name
        cell.check.isHidden = item.isChecked


        return cell
    }
   

}
