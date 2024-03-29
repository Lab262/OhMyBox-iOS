//
//  BrandTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 03/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandTableViewCell: UITableViewCell {

    static var identifier: String {
        return "brandTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 375
    }
    
    static var nibName: String {
        return "BrandTableViewCell"
    }
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandDescriptionLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var followButton: UIButton!
    
    var followAction: ((UIButton) -> ())?
    var following = false
    
    let followButtonHighlightedTitle = "Seguindo"
    let followButtonHighlightedBackgroundColor = UIColor.colorWithHexString("29143C")
    let followButtonHighlightedBorderColor = UIColor.clear
    let followButtonHighlightedTitleColor = UIColor.white
    
    let followButtonNormalTitle = "Seguir"
    let followButtonNormalBackgroundColor = UIColor.white
    let followButtonNormalBorderColor = UIColor.colorWithHexString("081F3E")
    let followButtonNormalTitleColor = UIColor.colorWithHexString("081F3E")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func follow(_ sender: UIButton) {
        followAction?(sender)
        
        following = !following
        changeFollowButtonToHighlightedStyle(following)
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
}
