//
//  TaskTableViewCell.swift
//  ABTodolist
//
//  Created by Brosteau on 21/08/17.
//  Copyright © 2017 Brosteau Alexandre. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var dueDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
