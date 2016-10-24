//
//  TermTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 24/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class TermTableViewCell: UITableViewCell {
    static let identifier = "termTextCell"
    
    @IBOutlet weak var titleTermLabel: UILabel!
    @IBOutlet weak var frameIconView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
