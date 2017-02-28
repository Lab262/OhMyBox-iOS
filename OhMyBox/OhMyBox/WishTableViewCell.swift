//
//  WishTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 19/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class WishTableViewCell: UITableViewCell {
    static var identifier: String {
        return "wishCell"
    }
   
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var storeDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var hearButton: UIButton!
    @IBOutlet weak var bgView: UIView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgView.layer.borderWidth = 1
        self.bgView.layer.borderColor = UIColor(red:184/250, green:184/250, blue:184/250, alpha: 1.0).cgColor

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
