//
//  BrandsHeaderTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 03/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandsHeaderTableViewCell: UITableViewCell {

    static var cellHeight: CGFloat {
        return 85
    }
    
    static var identifier: String {
        return "brandsHeaderView"
    }
    
    static var nibName: String {
        return "BrandsHeaderTableViewCell"
    }
    
    @IBOutlet weak var topLineLabel: UILabel!
    @IBOutlet weak var bottomLineLabel: UILabel!
    @IBOutlet weak var showAllButton: UIButton!
    
    var showAllAction: ((UIButton) -> ())?
    
    @IBAction func showAll(_ sender: UIButton) {
        showAllAction?(sender)
    }
}
