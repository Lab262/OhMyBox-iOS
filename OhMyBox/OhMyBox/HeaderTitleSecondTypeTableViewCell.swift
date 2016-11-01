//
//  HeaderTitleSecondTypeTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HeaderTitleSecondTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var showAll: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
