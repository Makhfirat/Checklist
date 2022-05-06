//
//  ChecklistGroup.swift
//  Checklist
//
//  Created by Macbook on 4/18/22.
//

import Foundation


struct ChecklistGroup {
    let title: String
    let imageName: String
    var items: [ChecklistItem]
    
    func getRemainings() -> String {
        // All Done
        var isAllDone = true
        for item in items {
            if item.isChecked == true {
                isAllDone = false
            }
            if isAllDone {
                return "All Done"
            }
        }
        // No items
        
        if items.count == 0 {
        }
        if items.isEmpty {
            return "no items"
        }else{
            return "\(items.count) Remaining"
        }
        if isAllDone {
            return "All Done"
        }else {
            return "incorrect data"
        }
    }
    
}
