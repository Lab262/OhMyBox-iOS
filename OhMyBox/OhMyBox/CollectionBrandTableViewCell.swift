//
//  CollectionBrandTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class CollectionBrandTableViewCell: UITableViewCell {
    
    
    static let identifier = "collectionBrandCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var tagNameImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
