//
//  ProductImageTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 02/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductImageTableViewCell: UITableViewCell {

    static var identifier: String {
        return "productImageTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 334
    }
    
    static var nibName: String {
        return "ProductImageTableViewCell"
    }
    
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
