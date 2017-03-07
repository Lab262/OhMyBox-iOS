//
//  ProfilePurchaseInfoTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProfilePurchaseInfoTableViewCell: UITableViewCell {

    static var identifier: String {
        return "profilePurchaseInfoTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return UITableViewAutomaticDimension
    }
    
    static var nibName: String {
        return "ProfilePurchaseInfoTableViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.cornerRadius = 4
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
