//
//  HeaderTitleTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HeaderTitleTableViewCell: UITableViewCell {
    
    
    static let identifier = "headerCell"
    
    @IBOutlet weak var firstTitleLineLabel: UILabel!
    @IBOutlet weak var secondTitleLineLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var showAllButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
