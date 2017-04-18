//
//  RegisterFieldTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 18/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class RegisterFieldTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "registerFieldTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 55
    }
    
    static var nibName: String {
        return "RegisterFieldTableViewCell"
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
