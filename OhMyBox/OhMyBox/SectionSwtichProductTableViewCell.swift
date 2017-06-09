//
//  SectionSwtichProductTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 26/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SectionSwtichProductTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var descriptionProductButton: UIButton!
    @IBOutlet weak var detailProductButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
