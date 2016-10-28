//
//  ContentStoreTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 27/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ContentStoreTableViewCell: UITableViewCell {
    
    static let identifier = "contentStoreViewCell"

    
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var phraseStore: UILabel!
    @IBOutlet weak var nameStore: UILabel!
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var backgroundContent: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.storeImage.roundToCircle()
        self.backgroundContent.layer.borderWidth = 1
        self.backgroundContent.layer.borderColor = UIColor(red:184/250, green:184/250, blue:184/250, alpha: 1.0).cgColor
    
        self.followButton.layer.borderWidth = 1
        self.followButton.layer.borderColor = UIColor(red:184/250, green:184/250, blue:184/250, alpha: 1.0).cgColor
        
    
    }
    
}
