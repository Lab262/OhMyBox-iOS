//
//  BrandTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 03/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandTableViewCell: UITableViewCell {

    static var identifier: String {
        return "brandTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 375
    }
    
    static var nibName: String {
        return "BrandTableViewCell"
    }
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandDescriptionLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var followButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
