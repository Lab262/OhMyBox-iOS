//
//  TagView2.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 28/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class TagView2: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var followLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TagView2", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    override func awakeFromNib() {
    
        self.followButton.setImage(#imageLiteral(resourceName: "follow_button"), for: .normal)
        self.followButton.setImage(#imageLiteral(resourceName: "following_button"), for: .selected)
    }
    
    func setInitialButtonState() {
        if self.followButton.isSelected {
            self.followLabel.text = "Seguindo"
            self.followLabel.textColor = UIColor.white
        } else {
            self.followLabel.text = "Seguir"
            self.followLabel.textColor = UIColor.colorWithHexString("241932")
        }
    }
    
    func changeButtonState() {
        
        if self.followButton.isSelected {
            self.followButton.isSelected = false
            self.followLabel.text = "Seguir"
            self.followLabel.textColor = UIColor.colorWithHexString("241932")
            
        } else {
            self.followButton.isSelected = true
            self.followLabel.text = "Seguindo"
            self.followLabel.textColor = UIColor.white
        }
    }
    
    @IBAction func clickedFollowButton(_ sender: Any) {
        self.changeButtonState()
    }


}
