//
//  ViewController+NavigationBar.swift
//  Tasks
//
//  Created by Daniel Akinniranye on 5/24/22.
//

import Foundation
import UIKit

extension ViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "AppColor") ?? .blue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.bold)]
    }
}
