//
//  BrandCollectionCollectionViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 06/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandCollectionCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return "brandCollectionCollectionViewCell"
    }
    
    static var cellSize: CGSize {
        return CGSize(width: 270, height: 283)
    }
    
    static var nibName: String {
        return "BrandCollectionCollectionViewCell"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
