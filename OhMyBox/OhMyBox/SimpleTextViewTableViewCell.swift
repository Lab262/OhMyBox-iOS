//
//  SimpleTextViewTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 26/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SimpleTextViewTableViewCell: UITableViewCell {
    static let identifier = "simpleTextViewCell"
    
    
    @IBOutlet weak var textDetailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
    }
    
}
