//
//  ProfilePhotoTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProfilePhotoTableViewCell: UITableViewCell {

    static var identifier: String {
        return "profilePhotoTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 171.0
    }
    
    static var nibName: String {
        return "ProfilePhotoTableViewCell"
    }
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
