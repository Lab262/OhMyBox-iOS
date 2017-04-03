//
//  PurchaseButtonHeaderTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PurchaseButtonHeaderTableViewCell: UITableViewCell {

    typealias Info = (topTitle: String, bottomTitle: String)
    
    static var cellHeight: CGFloat {
        return 81.0
    }
    
    static var identifier: String {
        return "purchaseButtonHeaderTableViewCell"
    }
    
    static var nibName: String {
        return "PurchaseButtonHeaderTableViewCell"
    }
    
    @IBOutlet weak var topLineLabel: UILabel!
    @IBOutlet weak var bottomLineLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    var info: Info? {
        didSet {
            updateInfo()
        }
    }
    
    var editButtonHandler: UIButton.ButtonHandler?
    
    @IBAction func editAction(_ sender: UIButton) {
        editButtonHandler?(sender)
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
        topLineLabel.attributedText = info?.topTitle.with(characterSpacing: 1.88)
        bottomLineLabel.attributedText = info?.bottomTitle.with(characterSpacing: 1.88)
    }
}
