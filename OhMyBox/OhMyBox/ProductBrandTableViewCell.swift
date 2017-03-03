//
//  ProductBrandTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 03/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductBrandTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "productBrandTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 88.0
    }
    
    static var nibName: String {
        return "ProductBrandTableViewCell"
    }
    
    @IBOutlet weak var brandNameTopLabel: UILabel!
    @IBOutlet weak var brandNameBottomLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!

    var brandNameTopLine: String? {
        didSet {
            if let brandNameTopLine = brandNameTopLine {
                brandNameTopLabel.attributedText = brandNameTopLine.with(characterSpacing: 1.5)
            } else {
                brandNameTopLabel.attributedText = nil
            }
        }
    }
    
    var brandNameBottomLine: String? {
        didSet {
            if let brandNameBottomLine = brandNameBottomLine {
                brandNameBottomLabel.attributedText = brandNameBottomLine.with(characterSpacing: 1.5)
            } else {
                brandNameBottomLabel.attributedText = nil
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
