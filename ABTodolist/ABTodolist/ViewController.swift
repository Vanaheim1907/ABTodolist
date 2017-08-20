//
//  ViewController.swift
//  ABTodolist
//
//  Created by Brosteau on 17/08/17.
//  Copyright © 2017 Brosteau Alexandre. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    let startDatePicker = UIDatePicker()
    let dueDatePicker = UIDatePicker()
    let currentDate = Date()
    
    
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
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == startDateTextField  {
            dueDateTextField.isUserInteractionEnabled = true
            dueDatePicker.minimumDate = startDatePicker.date
        }
    }
    
    func dateToString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY HH:mm"
        
        let dateFormatted = dateFormatter.string(from: dueDatePicker.date)
        
        return dateFormatted
    }
    
}

