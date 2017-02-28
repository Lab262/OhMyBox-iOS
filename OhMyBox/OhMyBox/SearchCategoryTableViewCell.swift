//
//  SearchCategoryTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchCategoryTableViewCell: UITableViewCell {

    static var identifier: String {
        return "categoryCell"
    }
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    var categoryName: String? {
        didSet {
            if let categoryName = categoryName {
                categoryNameLabel.attributedText = categoryName.uppercased().with(characterSpacing: 0.84)
            } else {
                categoryNameLabel.attributedText = nil
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
