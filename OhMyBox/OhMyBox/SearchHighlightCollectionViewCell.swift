//
//  SearchHighlightCollectionViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchHighlightCollectionViewCell: UICollectionViewCell {

    static let cellSize = CGSize(width: 177.0, height: 163.0)
    static let identifier = "searchHighlightCollectionViewCell"
    @IBOutlet weak var highlightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
