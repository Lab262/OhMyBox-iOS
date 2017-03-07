//
//  ProfileMeasureTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProfileMeasureTableViewCell: UITableViewCell {

    static var identifier: String {
        return "profileMeasureTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 55.0
    }
    
    static var nibName: String {
        return "ProfileMeasureTableViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var separatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setSeparatorHidden(_ hidden: Bool) {
        separatorView.isHidden = hidden
    }
    
}
