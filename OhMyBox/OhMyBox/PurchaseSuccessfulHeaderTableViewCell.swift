//
//  PurchaseSuccessfulHeaderTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 14/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PurchaseSuccessfulHeaderTableViewCell: UITableViewCell {

    typealias Info = (topTitle: String, bottomTitle: String, subtitle: String)
    
    static var identifier: String {
        return "purchaseSuccessfulHeaderTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 128.0
    }
    
    static var nibName: String {
        return "PurchaseSuccessfulHeaderTableViewCell"
    }
    
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var bottomTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
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
        topTitleLabel.attributedText = info?.topTitle.with(characterSpacing: 1.83)
        bottomTitleLabel.attributedText = info?.bottomTitle.with(characterSpacing: 1.83)
        subtitleLabel.attributedText = info?.subtitle.with(characterSpacing: 1.31, lineSpacing: 0)
    }
    
}
