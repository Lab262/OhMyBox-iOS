//
//  DetailProudctTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 24/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class DetailProudctTableViewCell: UITableViewCell {
    static var identifier: String {
        return "detailProductCell"
    }
    
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var productImage:UIImageView!
    @IBOutlet weak var backgrounBoard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      //  self.productImage.addParallaxToView(amount:500)
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
