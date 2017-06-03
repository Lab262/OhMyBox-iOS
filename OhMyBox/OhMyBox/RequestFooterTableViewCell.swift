//
//  RequestFooterTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 10/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class RequestFooterTableViewCell: UITableViewCell {

    static var identifier: String {
        return "requestFooterTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 46
    }
    
    static var nibName: String {
        return "RequestFooterTableViewCell"
    }
    
    @IBOutlet weak var button: UIButton!
    
    var buttonHandler: UIButton.ButtonHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.titleLabel?.attributedText = button.titleLabel?.text?.with(characterSpacing: 1.7)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        buttonHandler?(sender)
    }
    
}
