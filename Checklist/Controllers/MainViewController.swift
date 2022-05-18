//
//  ViewController.swift
//  Checklist
//
//  Created by Macbook on 4/15/22.
//

import UIKit


class MainViewController: UITableViewController, GroupDetailsProtocol {
    ///MARK:- мои данные
    func didDeleteItem(at index: Int, with groupTitle: String) {
            for (groupIndex, group)  in groups.enumerated() {
                if group.title == groupTitle{
                    groups[groupIndex].items.remove(at: index)
                    tableView.reloadData()
                }
            }
        }
    
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
    
    //// MARK:- жизненный цикл  VIew Controller
    override func viewDidLoad() {
        super.viewDidLoad()
 /// Подписываемся на нотификацию о создании заметки
        NotificationCenter.default.addObserver(self, selector: #selector(handleAddNoteNotification), name: .noteHasBeenCreated, object: nil)
    }
    
    
    @objc func handleAddNoteNotification(_ notification: Notification) {
        if let object = notification.object as? (ChecklistItem, String){
        print("обрабатываю добавление новой заметки")
            print("Получил значение: \(object.0)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    //// Mark:  источник данных для таблицы
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let group = groups[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.iconView.image = UIImage(named: group.imageName)
        cell.titleLabel.text = group.title
        cell.subtitleLabel.text = group.getRemainings()
        return cell 
    }

   /// MARK:- Обработка segue (переходы)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToGroupDetails" {
            if let vc = segue.destination as? GroupDetailsTableViewController  {
                if let indexPath = tableView.indexPathForSelectedRow {
                  ///  vc.title = groups[indexPath.row].title
                    ///vc.items = groups[indexPath.row].items
                    vc.group = groups[indexPath.row]
                    vc.delegate = self
                    
                }
            }
        }
    }
/// Обработка делегата таблицы
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("pushed on the cell \(indexPath.row)")
//   }
//  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//      ///     удаление данных из массива
//       groups.remove(at: indexPath.row)
//
//        // удалить  ячейку из самой таблицы
//       tableView.deleteRows(at:[indexPath], with:.automatic)
//
//
//  }
}
