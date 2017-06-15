//
//  CardInformationTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CardInformationTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "cardCell"
    }
    
    static var cellHeight: CGFloat {
        return 80.0
    }
    
    static var nibName: String {
        return "CardInformationTableViewCell"
    }
    @IBOutlet weak var cardNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
