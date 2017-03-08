//
//  ProfileCredentialsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProfileCredentialsTableViewCell: UITableViewCell {

    static var identifier: String {
        return "profileCredentialsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 55.0
    }
    
    static var nibName: String {
        return "ProfileCredentialsTableViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    var title: String? {
        didSet {
            titleLabel.attributedText = title?.with(characterSpacing: 1.69)
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
    
    override func setSeparatorHidden(_ hidden: Bool) {
        separatorView.isHidden = hidden
    }
    
    override func prepareForReuse() {
        setSeparatorHidden(false)
    }
    
}
