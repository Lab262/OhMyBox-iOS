//
//  CollectionPickerViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 16/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CollectionPickerViewCell: UICollectionViewCell {
    
    static var cellSize: CGSize {
        return CGSize(width: 125.0, height: 58.0)
    }
    static var identifier: String {
        return "collectionPickerViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.attributedText = title?.with(characterSpacing: 3.49)
        }
    }

}
