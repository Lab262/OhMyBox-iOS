//
//  SegmentTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 20/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SegmentTableViewCell: UITableViewCell {
    static var identifier: String {
        return "segmentCell"
    }
    
    @IBOutlet weak var aboutBoxButton: UIButton!
    @IBOutlet weak var dataUserButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
