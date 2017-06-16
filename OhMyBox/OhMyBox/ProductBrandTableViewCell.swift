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
    
    let followButtonHighlightedTitle = "Seguindo"
    let followButtonHighlightedBackgroundColor = UIColor.colorWithHexString("29143C")
    let followButtonHighlightedBorderColor = UIColor.clear
    let followButtonHighlightedTitleColor = UIColor.white
    
    let followButtonNormalTitle = "Seguir"
    let followButtonNormalBackgroundColor = UIColor.white
    let followButtonNormalBorderColor = UIColor.colorWithHexString("081F3E")
    let followButtonNormalTitleColor = UIColor.colorWithHexString("081F3E")
    
    var followButtonHandler: UIButton.ButtonHandler?

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
    
    func changeFollowButtonToHighlightedStyle(_ highlighted: Bool) {
        
        let animationDuration = 0.07
        
        if highlighted {
            UIView.animate(withDuration: animationDuration) {
                self.followButton.backgroundColor = self.followButtonHighlightedBackgroundColor
                self.followButton.borderColor = self.followButtonHighlightedBorderColor
                self.followButton.setTitleColor(self.followButtonHighlightedTitleColor, for: .normal)
            }
            followButton.setTitle(followButtonHighlightedTitle, for: .normal)
        } else {
            UIView.animate(withDuration: animationDuration) {
                self.followButton.backgroundColor = self.followButtonNormalBackgroundColor
                self.followButton.borderColor = self.followButtonNormalBorderColor
                self.followButton.setTitleColor(self.followButtonNormalTitleColor, for: .normal)
            }
            followButton.setTitle(followButtonNormalTitle, for: .normal)
        }
    }

    @IBAction func followButtonAction(_ sender: UIButton) {
        
        followButtonHandler?(sender)
    }
    
}
