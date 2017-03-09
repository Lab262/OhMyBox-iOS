//
//  ShoppingRequestsHeaderTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingRequestsHeaderTableViewCell: UITableViewCell {

    static var identifier: String {
        return "shoppingRequestsHeaderTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 44.0
    }
    
    static var nibName: String {
        return "ShoppingRequestsHeaderTableViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.attributedText = title?.with(characterSpacing: 1.88)
        }
    }
    
    var index: Int? {
        didSet {
            if let index = index {
                let indexString = String(format: "%02d", index)
                indexLabel.attributedText = indexString.with(characterSpacing: 1.88)
            } else {
                indexLabel.attributedText = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title = titleLabel.text
        index = Int(indexLabel.text!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
