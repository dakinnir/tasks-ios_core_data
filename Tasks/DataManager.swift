//
//  DataManager.swift
//  Tasks
//
//  Created by Daniel Akinniranye on 5/24/22.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    
    // MARK: - Properties
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var todayTasks = [Task]()
    var tomorrowTasks = [Task]()
    var upcomingTasks = [Task]()
    var tasks: [Task] = []
    
    func retrieveTasks() {
        do {
            self.tasks = try context.fetch(Task.fetchRequest())

            _ = tasks.map { task in
                switch task.sectionNumber {
                case 0:
                    todayTasks.append(task)
                case 1:
                    tomorrowTasks.append(task)
                case 2:
                    upcomingTasks.append(task)
                default:
                    break
                }
            }
        
        } catch {
            print(error)
        }
    }
    
}
