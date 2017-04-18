//
//  LogoTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 18/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class LogoTableViewCell: UITableViewCell {

    static var identifier: String {
        return "logoTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 151 * UIView.heightScaleProportion()
    }
    
    static var nibName: String {
        return "LogoTableViewCell"
    }
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
