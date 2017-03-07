//
//  ProfileTableHeaderView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProfileTableHeaderView: UITableViewCell {

    static var cellHeight: CGFloat {
        return 100.0
    }
    
    static var identifier: String {
        return "profileTableHeaderView"
    }
    
    static var nibName: String {
        return "ProfileTableHeaderView"
    }
    
    @IBOutlet weak var topLineLabel: UILabel!
    @IBOutlet weak var bottomLineLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    var editHandler: UIButton.ButtonHandler?
    
    @IBAction func edit(_ sender: UIButton) {
        editHandler?(sender)
    }
}
