//
//  BrandCollectionViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 03/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return "brandCollectionViewCell"
    }
    
    static var cellSize: CGSize {
        return CGSize(width: 270, height: 274)
    }
    
    static var nibName: String {
        return "BrandCollectionViewCell"
    }
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandDescriptionLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var followButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
