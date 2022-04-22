//
//  ItemsTableViewCell.swift
//  Checklist
//
//  Created by Macbook on 4/22/22.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var check: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
