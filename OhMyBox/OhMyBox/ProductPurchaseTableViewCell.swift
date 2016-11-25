//
//  ProductPurchaseTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 02/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ProductPurchaseTableViewCell: UITableViewCell {
    
      static let identifier = "productPurchaseCell"
    @IBOutlet weak var nameProductLabel: UILabel!

    @IBOutlet weak var nameStoreLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
