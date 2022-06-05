//
//  TaskTableViewCell.swift
//  Tasks
//
//  Created by Daniel Akinniranye on 5/23/22.
//

import UIKit
    
class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(title: String, date: Date) {
        titleLabel.text = title
        dateLabel.text = date.cellDateLabel()
    }
    
}
