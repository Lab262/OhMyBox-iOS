//
//  ProfileLabelTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProfileLabelTableViewCell: UITableViewCell {

    static var identifier: String {
        return "profileLabelTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 83.0
    }
    
    static var nibName: String {
        return "ProfileLabelTableViewCell"
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var name: String? {
        didSet {
            nameLabel.attributedText = name?.with(characterSpacing: 3.47)
        }
    }
    
    var profileDescription: String? {
        didSet {
            descriptionLabel.attributedText = profileDescription?.with(characterSpacing: 0.97)
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
    
}
