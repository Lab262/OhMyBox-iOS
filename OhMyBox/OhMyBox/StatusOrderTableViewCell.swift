//
//  StatusOrderTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 21/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class StatusOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var headContentView: UIView!
    
    @IBOutlet weak var dataTime: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var footContentView: UIView!
     static var identifier: String {
        return "statusOrderCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
