//
//  PurchaseSuccessfulTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 14/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PurchaseSuccessfulTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "purchaseSuccessfulTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return UITableViewAutomaticDimension
    }
    
    static var nibName: String {
        return "PurchaseSuccessfulTableViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: NSAttributedString? {
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
        titleLabel.attributedText = title
    }
    
}
