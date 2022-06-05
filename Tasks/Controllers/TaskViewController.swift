//
//  TaskViewController.swift
//  Tasks
//
//  Created by Daniel Akinniranye on 5/24/22.
//

import Foundation
import UIKit
import CoreData

class TaskViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    var task: Task?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Inital setup
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 10
        if task != nil {
            titleTextField.text = task?.title
            datePicker.date = task?.timestamp ?? Date()
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        if let currentTask = task {
            updateTask(task: currentTask)
            saveData()
            return
        }
        
        // Creating a Task object to add to Core Data
        let newTask = Task(context: context)
        
        newTask.timestamp = datePicker.date
        newTask.isCompleted = false
        newTask.title = titleTextField.text
        saveData()
    }
    
    
    func saveData() {
        do { try context.save() }
        catch { print(error) }
    }
    
    func updateTask(task: Task) {
        task.title = titleTextField.text
        task.timestamp = datePicker.date
    }
}
