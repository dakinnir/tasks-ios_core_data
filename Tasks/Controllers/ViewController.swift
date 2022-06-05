//
//  ViewController.swift
//  Tasks
//
//  Created by Daniel Akinniranye on 5/23/22.
//

import UIKit
import CoreData

public enum Section: Int, CaseIterable {
    case today, tommorrow, upcoming
}

class ViewController: UITableViewController {
    
    // MARK: - Properties
    var container: NSPersistentContainer?
    
    // Reference to managed object contex
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var dataManager = DataManager()
    
    var tasks: [[Task]] = []
    
    // Section Headers
    var sections: [Section] = [.today, .tommorrow, .upcoming]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(currentDate.addingTimeInterval(64000))

        title = "Tasks"
        self.setupNavigationBar()
        // Retrieving saved objects from Core Data
        fetchTasks()
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
    }
    
    func fetchTasks() {
        dataManager.retrieveTasks()
        tasks.append(dataManager.todayTasks)
        tasks.append(dataManager.tomorrowTasks)
        tasks.append(dataManager.upcomingTasks)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension ViewController {
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskTableViewCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        let task = tasks[indexPath.section][indexPath.row]
        cell.setupCell(title: task.title ?? "", date: task.timestamp ?? Date())
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks[section].count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "TaskViewController") as? TaskViewController {
            viewController.task = tasks[indexPath.section][indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTasks()
    }
}

// MARK: - Sections
extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections[section]
        switch section {
            
        case .today:
            return "Today".uppercased()
        case .tommorrow:
            return "Tomorrow".uppercased()
        case .upcoming:
            return "Upcoming".uppercased()
        }
    }
}

// MARK: - Editing
extension ViewController {
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let task = self.tasks[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        self.tasks[sourceIndexPath.section].insert(task, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Get the task that will be deleted
            let taskToDelete = self.tasks[indexPath.section][indexPath.row]
            self.context.delete(taskToDelete)
            // Update our context
            do { try self.context.save() }
            catch {
                print(error)
            }
            // Remove the row deleted from the tableView
            tasks[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
