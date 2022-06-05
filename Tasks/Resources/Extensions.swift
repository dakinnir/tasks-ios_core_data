//
//  Extensions.swift
//  Tasks
//
//  Created by Daniel Akinniranye on 6/5/22.
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


extension ViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "AppColor") ?? .blue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.bold)]
    }
}
