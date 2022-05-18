//
//  TextFieldTableViewCell.swift
//  Checklist
//
//  Created by Macbook on 4/25/22.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func textFieldDidChange(_ sender: UITextField) {
        print(sender.text)
    }
}
