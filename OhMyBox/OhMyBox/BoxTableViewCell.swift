//
//  BoxTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 04/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxTableViewCell: UITableViewCell {
   
    static var identifier: String {
        return "boxTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 215
    }
    
    static var nibName: String {
        return "BoxTableViewCell"
    }
    
    @IBOutlet weak var boxView: BoxView!
    
    var info: BoxView.Info? {
        
        didSet {
            
            boxView.info = info
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        boxView.showsBoxButton = false
        boxView.showsLikeButton = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
