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
        return 237.0
    }
    
    static var nibName: String {
        return "ProductDetailTableViewCell"
    }
    
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var detailsButton: UIButton!
    
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
    }
    func setDetailsButtonHighlighted() {
        setButtonHighlighted(detailsButton)
        setButtonUnhighlighted(descriptionButton)
    }
    
}
