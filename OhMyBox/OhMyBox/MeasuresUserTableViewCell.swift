//
//  MeasuresUserTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 23/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class MeasuresUserTableViewCell: UITableViewCell {
    static var identifier: String {
        return "measureUserCell"
    }

    @IBOutlet weak var sizeImage: UIImageView!
    @IBOutlet weak var TitleSizeLabel: UILabel!
    @IBOutlet weak var titleMeasure: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
