//
//  PurchaseSuccessfulButtonTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 14/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PurchaseSuccessfulButtonTableViewCell: UITableViewCell {
   
    static var identifier: String {
        return "purchaseSuccessfulButtonTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 66.0
    }
    
    static var nibName: String {
        return "PurchaseSuccessfulButtonTableViewCell"
    }
    
    @IBOutlet weak var button: UIButton!
    
    var buttonTitle: String? {
        didSet {
            updateInfo()
        }
    }
    var buttonHandler: UIButton.ButtonHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        buttonHandler?(sender)
    }
    
    func updateInfo() {
        button.setAttributedTitle(buttonTitle?.with(characterSpacing: 1.5, color: .black), for: .normal)
    }
    
}
