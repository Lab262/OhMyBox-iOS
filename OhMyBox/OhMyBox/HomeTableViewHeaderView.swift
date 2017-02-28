//
//  HomeTableViewHeaderView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class HomeTableViewHeaderView: UITableViewCell {

    static var cellHeight: CGFloat {
        return 100.0
    }
    
    static var identifier: String {
        return "homeHeaderView"
    }
    
    @IBOutlet weak var topLineLabel: UILabel!
    @IBOutlet weak var bottomLineLabel: UILabel!
    @IBOutlet weak var showAllButton: UIButton!
    
    var showAllAction: ((UIButton) -> ())?
    
    @IBAction func showAll(_ sender: UIButton) {
        showAllAction?(sender)
    }
}
