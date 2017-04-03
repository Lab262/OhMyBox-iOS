//
//  BrandContactInfoTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandContactInfoTableViewCell: UITableViewCell {

    static var identifier: String {
        return "brandContactInfoTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 64.0
    }
    
    static var nibName: String {
        return "BrandContactInfoTableViewCell"
    }
    
    typealias Info = (title: String, value: String)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    var info: Info? {
        didSet {
            updateInfo()
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
    
    func updateInfo() {
        if let info = info {
            
            titleLabel.text = info.title
            valueLabel.attributedText = info.value.with(characterSpacing: 1.7)
        } else {
            
            titleLabel.text = nil
            valueLabel.attributedText = nil
        }
    }
    
}
