//
//  DiscountTitleTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 02/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class DiscountTitleTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "discountTitleCell"
    }

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
