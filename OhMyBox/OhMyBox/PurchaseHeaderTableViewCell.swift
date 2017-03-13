//
//  PurchaseHeaderTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PurchaseHeaderTableViewCell: UITableViewCell {

    static var identifier: String {
        return "purchaseHeaderTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 46.0
    }
    
    static var nibName: String {
        return "PurchaseHeaderTableViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            updateInfo()
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
    
    func updateInfo() {
        titleLabel.attributedText = title?.with(characterSpacing: 1.88)
    }
    
}
