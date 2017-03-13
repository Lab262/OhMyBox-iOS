//
//  BrandContactTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandContactHeaderTableViewCell: UITableViewCell {

    static var identifier: String {
        return "brandContactHeaderTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 105.0
    }
    
    static var nibName: String {
        return "BrandContactHeaderTableViewCell"
    }
    
    typealias Info = (topTitle: String, bottomTitle: String)
    
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var bottomTitleLabel: UILabel!
    
    var info: Info? {
        didSet {
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateInfo() {
        topTitleLabel.attributedText = info?.topTitle.with(characterSpacing: 1.22)
        bottomTitleLabel.attributedText = info?.bottomTitle.with(characterSpacing: 1.22)
    }
    
}
