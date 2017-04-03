//
//  MiniProductCollectionViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class MiniProductCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return "miniProductCollectionViewCell"
    }
    
    static var cellSize: CGSize {
        return CGSize(width: 270, height: 277)
    }
    
    static var nibName: String {
        return "MiniProductCollectionViewCell"
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandCreditsLabel: UILabel!
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
