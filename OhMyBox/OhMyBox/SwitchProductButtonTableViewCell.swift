//
//  SwitchProductButtonTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 26/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SwitchProductButtonTableViewCell: UITableViewCell {
    static let identifier = "switchButtonProductCell"
   
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.detailButton.layer.borderWidth = 1
        self.detailButton.layer.borderColor = UIColor(red:184/250, green:184/250, blue:184/250, alpha: 1.0).cgColor
    
    
        self.descriptionButton.layer.borderWidth = 1
        self.descriptionButton.layer.borderColor = UIColor(red:184/250, green:184/250, blue:184/250, alpha: 1.0).cgColor
    
    
    }
    @IBAction func selectDescription(_ sender: AnyObject) {
        
    }
    @IBAction func selectDetail(_ sender: AnyObject) {
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
