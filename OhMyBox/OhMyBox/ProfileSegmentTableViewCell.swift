//
//  ProfileSegmentTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProfileSegmentTableViewCell: UITableViewCell {

    static var identifier: String {
        return "profileSegmentTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 36.0
    }
    
    static var nibName: String {
        return "ProfileSegmentTableViewCell"
    }
    
    @IBOutlet weak var buttonSegmentedView: ButtonSegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
