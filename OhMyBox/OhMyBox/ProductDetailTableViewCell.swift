//
//  ProductDetailTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 02/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {

    static var identifier: String {
        return "productDetailTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return UITableViewAutomaticDimension
    }
    
    static var nibName: String {
        return "ProductDetailTableViewCell"
    }
    
    
    weak var descriptionButton: UIButton!
    weak var detailsButton: UIButton!
    @IBOutlet weak var buttonSegmentedControl: ButtonSegmentedControl!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var descriptionButtonHandler: UIButton.ButtonHandler?
    var detailsButtonHandler: UIButton.ButtonHandler?
    
    var isDescriptionButtonHighlighted = false {
        
        didSet {
            updateDescriptionLabelText()
        }
    }
    
    var productDescription: String? {
        didSet {
            if isDescriptionButtonHighlighted {
                updateDescriptionLabelText()
            }
        }
    }
    var productDetails: String? {
        didSet {
            if !isDescriptionButtonHighlighted {
                updateDescriptionLabelText()
            }
        }
    }
    
    var attributedDescription: NSAttributedString? {
        if let description = productDescription {
            return description.with(characterSpacing: 1.22)
        } else {
            return nil
        }
    }
    
    var attributedDetails: NSAttributedString? {
        if let details = productDetails {
            return details.with(characterSpacing: 1.22)
        } else {
            return nil
        }
    }
    
    let buttonHighlightedTitleColor = UIColor.white
    let buttonHighlightedBackgroundColor = UIColor.colorWithHexString("241932")
    let buttonHighlightedBorderColor = UIColor.clear
    
    let buttonNormalTitleColor = UIColor.colorWithHexString("919191")
    let buttonNormalBorderColor = UIColor.colorWithHexString("919191")
    let buttonNormalBackgroundColor = UIColor.white
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buttonSegmentedControl.buttonHighlightedTitleColor = buttonHighlightedTitleColor
        buttonSegmentedControl.buttonHighlightedBackgroundColor = buttonHighlightedBackgroundColor
        buttonSegmentedControl.buttonHighlightedBorderColor = buttonHighlightedBorderColor
        
        buttonSegmentedControl.buttonNormalTitleColor = buttonNormalTitleColor
        buttonSegmentedControl.buttonNormalBorderColor = buttonNormalBorderColor
        buttonSegmentedControl.buttonNormalBackgroundColor = buttonNormalBackgroundColor
        
        buttonSegmentedControl.leftButtonHandler = descriptionButtonHandler
        buttonSegmentedControl.rightButtonHandler = detailsButtonHandler
        
        buttonSegmentedControl.leftButtonFont = Fonts.poppinsMedium
        buttonSegmentedControl.rightButtonFont = Fonts.poppinsMedium
    }
    
    func updateDescriptionLabelText() {
        if isDescriptionButtonHighlighted {
            descriptionLabel.attributedText = attributedDescription
        } else {
            descriptionLabel.attributedText = attributedDetails
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
