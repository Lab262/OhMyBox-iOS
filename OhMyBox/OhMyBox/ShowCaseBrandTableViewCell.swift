//
//  ShowCaseBrandTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 31/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShowCaseBrandTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var brandImage: UIImageView!
    
    @IBOutlet weak var titleBrandLabel: UILabel!
    
    @IBOutlet weak var subtitleBrandLabel: UILabel!

    static let identifier = "showCaseBrandCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
