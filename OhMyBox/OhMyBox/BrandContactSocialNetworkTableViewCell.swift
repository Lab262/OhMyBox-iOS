//
//  BrandContactSocialNetworkTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandContactSocialNetworkTableViewCell: UITableViewCell {

    static var identifier: String {
        return "brandContactSocialNetworkTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 65.0
    }
    
    static var nibName: String {
        return "BrandContactSocialNetworkTableViewCell"
    }
    
    typealias Info = (image: UIImage, title: String)
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
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
        titleLabel.attributedText = info?.title.with(characterSpacing: 1.7)
        iconImageView.image = info?.image
    }
    
}
