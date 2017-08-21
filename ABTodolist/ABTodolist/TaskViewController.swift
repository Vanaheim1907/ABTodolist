//
//  ViewController.swift
//  ABTodolist
//
//  Created by Brosteau on 17/08/17.
//  Copyright © 2017 Brosteau Alexandre. All rights reserved.
//

import UIKit
import UserNotifications
import os.log

class TaskViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    let startDatePicker = UIDatePicker()
    let dueDatePicker = UIDatePicker()
    let currentDate = Date()
    
    var newTask = TaskItem()
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var dueDateTextField: UITextField!
    
    @IBOutlet weak var startDateTextField: UITextField!
    
    @IBOutlet weak var saveTaskButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Delegate
        startDateTextField.delegate = self
        dueDateTextField.delegate = self
        
        dueDateTextField.isUserInteractionEnabled = false
        createStartDatePicker()
        createDueDatePicker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    func createToolbar() -> UIToolbar {
        // Create toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        return toolbar
    }
    
    func createStartDatePicker() {
        
        let toolbar = self.createToolbar()
        
        // Create save button Item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(self.startDateSelected))
        
        toolbar.setItems([doneButton], animated: true)
        
        startDateTextField.inputAccessoryView = toolbar
        
        startDatePicker.minimumDate = currentDate
        
        startDateTextField.inputView = startDatePicker
        
    }
    
    func createDueDatePicker() {
        let toolbar = self.createToolbar()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(self.dueDateSelected))
        
        toolbar.setItems([doneButton], animated: true)
        
        dueDateTextField.inputAccessoryView = toolbar
        
        dueDateTextField.inputView = dueDatePicker
    }
    func startDateSelected() {
        
        startDateTextField.text = self.dateToString(from: startDatePicker.date)
        dueDateTextField.text = self.dateToString(from: startDatePicker.date)
        
        self.view.endEditing(true)
    }
    
    func dueDateSelected() {
        
        dueDateTextField.text = self.dateToString(from: dueDatePicker.date)
    }
    
    func dateToString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY HH:mm"
        
        let dateFormatted = dateFormatter.string(from: date)
        
        return dateFormatted
    }
    
    func stringToDate(from stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        
        let date = dateFormatter.date(from: stringDate)
        return date!
    }
    //MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == startDateTextField  {
            dueDateTextField.isUserInteractionEnabled = true
            dueDatePicker.minimumDate = startDatePicker.date
        }
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        
        //saveButton has been pressed
        guard let button = sender as? UIBarButtonItem, button == saveTaskButton else {
            os_log("Save button was not pressed", log: OSLog.default, type: .debug)
            return
        }
        
        let taskName = taskNameTextField.text
        let dueDate = dueDateTextField.text
        let startDate = startDateTextField.text
        
        newTask = TaskItem(name: taskName!, startDate: stringToDate(from: dueDate!), dueDate: stringToDate(from: startDate!))
        
    }
}

