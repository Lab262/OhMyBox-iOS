//
//  DataUserTextFieldTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 21/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class DataUserTextFieldTableViewCell: UITableViewCell {
    static let identifier = "dataUserCell"
    
    @IBOutlet weak var nameFieldLabel: UILabel!
    @IBOutlet weak var infoUserLabel: UILabel!
   
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
