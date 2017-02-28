//
//  HeaderFinalPurchaseTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 02/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HeaderFinalPurchaseTableViewCell: UITableViewCell {
    static var identifier: String {
        return "headerFinalPurchaseCell"
    }

    @IBOutlet weak var headerTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
