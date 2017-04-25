//
//  BoxProductCollectionViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 25/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxProductCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return "boxProductCollectionViewCell"
    }
    
    static var cellSize: CGSize {
        return CGSize(width: 173, height: 203) * UIView.widthScaleProportion()
    }
    
    static var nibName: String {
        return "BoxProductCollectionViewCell"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
