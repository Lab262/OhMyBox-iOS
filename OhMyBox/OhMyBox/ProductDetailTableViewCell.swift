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
    
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    var descriptionButtonHandler: UIButton.ButtonHandler?
    var detailsButtonHandler: UIButton.ButtonHandler?
    
    var isDescriptionButtonHighlighted = false
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
        setDescriptionButtonHighlighted()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func descriptionAction(_ sender: Any) {
        setDescriptionButtonHighlighted()
    }
    
    @IBAction func detailsAction(_ sender: Any) {
        setDetailsButtonHighlighted()
    }
    
    func setButtonHighlighted(_ button: UIButton) {
        button.setTitleColor(buttonHighlightedTitleColor, for: .normal)
        button.backgroundColor = buttonHighlightedBackgroundColor
        button.borderColor = buttonHighlightedBorderColor
    }
    
    func setButtonUnhighlighted(_ button: UIButton) {
        button.setTitleColor(buttonNormalTitleColor, for: .normal)
        button.backgroundColor = buttonNormalBackgroundColor
        button.borderColor = buttonNormalBorderColor
    }
    
    func setDescriptionButtonHighlighted() {
        setButtonHighlighted(descriptionButton)
        setButtonUnhighlighted(detailsButton)
        
        isDescriptionButtonHighlighted = true
        updateDescriptionLabelText()
        descriptionButtonHandler?(descriptionButton)
    }
    
    func setDetailsButtonHighlighted() {
        setButtonHighlighted(detailsButton)
        setButtonUnhighlighted(descriptionButton)
        
        isDescriptionButtonHighlighted = false
        updateDescriptionLabelText()
        detailsButtonHandler?(detailsButton)
    }
    
    func updateDescriptionLabelText() {
        if isDescriptionButtonHighlighted {
            descriptionLabel.attributedText = attributedDescription
        } else {
            descriptionLabel.attributedText = attributedDetails
        }
    }
}
