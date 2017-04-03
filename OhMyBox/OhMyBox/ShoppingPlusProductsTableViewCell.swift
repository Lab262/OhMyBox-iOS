//
//  ShoppingPlusProductsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 10/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingPlusProductsTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "shoppingPlusProductsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 63
    }
    
    static var nibName: String {
        return "ShoppingPlusProductsTableViewCell"
    }
    
    @IBOutlet weak var button: UIButton!
    
    var buttonHandler: UIButton.ButtonHandler?
    var extraProductCount: Int = 0 {
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
    
    @IBAction func buttonAction(_ sender: UIButton) {
        buttonHandler?(sender)
    }
    
    func updateInfo() {
        
        let pluralCountString = extraProductCount == 1 ? "" : "s"
        let title = "+ \(extraProductCount) produto\(pluralCountString)"
        
        let attributedTitle = title.with(characterSpacing: 1.9, color: UIColor.colorWithHexString("0F0A0E"))

        button.setAttributedTitle(attributedTitle, for: .normal)
        
    }
    
}
