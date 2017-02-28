//
//  PromotionTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 19/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {
    static var identifier: String {
        return "promotionCell"
    }
    
    @IBOutlet weak var secondFirstLabel: UILabel!
    @IBOutlet weak var firsTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
