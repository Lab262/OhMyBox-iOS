//
//  SwitchProductButtonTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 26/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SwitchProductButtonTableViewCell: UITableViewCell {
    static let identifier = " switchProductButtonProductCell"
   
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
