//
//  SearchBrandCollectionViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchBrandCollectionViewCell: UICollectionViewCell {

    static var cellSize: CGSize {
        return CGSize(width: 75.0, height: 75.0)
    }
    static var identifier: String {
        return "searchBrandCollectionViewCell"
    }
    @IBOutlet weak var brandImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadius = 4.0
    }

}
