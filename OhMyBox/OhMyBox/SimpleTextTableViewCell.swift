//
//  SimpleTextTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 23/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SimpleTextTableViewCell: UITableViewCell {
    static var identifier: String {
        return "simpleTextCell"
    }
    
    @IBOutlet weak var simpleTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
