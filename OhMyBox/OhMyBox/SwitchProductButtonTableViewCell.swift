//
//  SwitchProductButtonTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 26/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SwitchProductButtonTableViewCell: UITableViewCell {
    static var identifier: String {
        return "switchButtonProductCell"
    }
   
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    
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
