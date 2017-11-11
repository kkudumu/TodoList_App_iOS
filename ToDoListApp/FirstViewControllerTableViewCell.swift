//
//  FirstViewControllerTableViewCell.swift
//  ToDoListApp
//
//  Created by Kioja Kudumu on 11/10/17.
//  Copyright © 2017 Kioja Kudumu. All rights reserved.
//

import UIKit

class FirstViewControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var datesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
