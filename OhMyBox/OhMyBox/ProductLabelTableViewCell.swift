//
//  ProductLabelTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 02/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductLabelTableViewCell: UITableViewCell {

    static var identifier: String {
        return "productLabelTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 77 * UIView.widthScaleProportion
    }
    
    static var nibName: String {
        return "ProductLabelTableViewCell"
    }
    
    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var priceLabel: UILabel!
    
    var name: String? {
        didSet {
            if let name = name {
                nameLabel.attributedText = name.with(characterSpacing: 1.88)
            } else {
                nameLabel.attributedText = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
