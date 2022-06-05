//
//  Task+CoreDataClass.swift
//  Tasks
//
//  Created by Daniel Akinniranye on 5/24/22.
//
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {
    var sectionNumber: Int {
        if (timestamp ?? Date()).compare(currentDate) == .orderedSame ||
            (timestamp ?? Date()).compare(currentDate) == .orderedAscending {
            return 0
        } else if
            (timestamp ?? Date()).compare(currentDate.addingTimeInterval(64000)) == .orderedDescending {
            return 1
        } else {
            return 2
        }
    }
}
