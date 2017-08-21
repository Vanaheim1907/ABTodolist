//
//  TaskTableViewController.swift
//  ABTodolist
//
//  Created by Brosteau on 21/08/17.
//  Copyright © 2017 Brosteau Alexandre. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    // MARK: - Properties
    var tasks = [TaskItem]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadSampleTask()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TaskTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell else {
            fatalError("The dequeue cell is not an instance of TaskTableViewCell")
        }
        
        let task = tasks[indexPath.row]

        // Configure the cell...
        cell.taskNameLabel.text = task.name
        cell.dueDateLabel.text = dateToString(from: task.dueDate)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Actions
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? TaskViewController {
            
            let newTask = sourceViewController.newTask
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tasks[selectedIndexPath.row] = newTask
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // add a new task
                let newIndexPath = IndexPath(row: tasks.count, section: 0)
                tasks.append(newTask)
                
                tableView.insertRows(at: [newIndexPath], with: .none)
            }
        }
    }
    
    
    // MARK: - Private methods
    private func loadSampleTask() {
        
        var dateComponent = DateComponents()
        dateComponent.day = 2
        
        let dueDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        
        
        let task1 = TaskItem(name: "TableViewController", startDate: Date(), dueDate: dueDate!)
        let task2 = TaskItem(name: "TableViewCell", startDate: Date(), dueDate: dueDate!)
        let task3 = TaskItem(name: "ViewController", startDate: Date(), dueDate: dueDate!)
        
        tasks += [task1, task2, task3]
        
    }
    
    private func dateToString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY HH:mm"
        
        let dateFormatted = dateFormatter.string(from: date)
        
        return dateFormatted
    }

}
