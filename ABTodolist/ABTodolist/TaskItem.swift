//
//  TaskItem.swift
//  ABTodolist
//
//  Created by Brosteau on 21/08/17.
//  Copyright © 2017 Brosteau Alexandre. All rights reserved.
//

import UIKit

class TaskItem {
    
    var name: String
    var startDate: Date
    var dueDate: Date
    
    
    init(name: String, startDate: Date, dueDate: Date) {
        self.name = name
        self.startDate = startDate
        self.dueDate = dueDate
    }
    
    convenience init() {
        self.init(name: "Taskname", startDate: Date(), dueDate: Date())
    }
}
