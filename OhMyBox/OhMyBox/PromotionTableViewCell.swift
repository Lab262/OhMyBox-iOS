//
//  PromotionTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 19/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {
    static let identifier = "promotionCell"
    
    @IBOutlet weak var secondFirstLabel: UILabel!
    @IBOutlet weak var firsTextLabel: UILabel!
    @IBOutlet weak var messagePromoLabel: UILabel!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.boxView.layer.borderWidth = 1
        self.boxView.layer.borderColor = UIColor(red:0/250, green:0/250, blue:0/250, alpha: 1.0).cgColor
    
        self.bgView.layer.borderWidth = 1
        self.bgView.layer.borderColor = UIColor(red:0/250, green:0/250, blue:0/250, alpha: 1.0).cgColor
    
        self.borderView.layer.borderWidth = 1
        self.borderView.layer.borderColor = UIColor(red:0/250, green:0/250, blue:0/250, alpha: 1.0).cgColor
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
