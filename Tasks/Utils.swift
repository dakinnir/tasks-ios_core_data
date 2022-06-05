//
//  Utils.swift
//  Tasks
//
//  Created by Daniel Akinniranye on 5/23/22.
//

import Foundation

extension Date {
    func navigationTitleDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMM"
        return dateFormatter.string(from: self)
    }
    
    func cellDateLabel() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM  dd, yyyy"
        return dateFormatter.string(from: self)
    }
}

public var currentDate = Date()
