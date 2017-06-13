//
//  SizeCollectionViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 20/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return "sizeCell"
    }
    
    static var cellSize: CGSize {
        return CGSize(width: 50.0, height: 38.0) * UIView.widthScaleProportion
    }
    
    static var nibName: String {
        return "SizeCollectionViewCell"
    }
    
    static let labelUnselectedColor = UIColor.colorWithHexString("8F8F8F")
    static let labelSelectedColor = UIColor.colorWithHexString("FFFFFF")
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    var size: String? {
        didSet {
            if let size = size {
                sizeLabel.attributedText = size.with(characterSpacing: 2.34, alignment: .center)
            } else {
                sizeLabel.attributedText = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectedView.cornerRadius = 5.0
    }

    override func changeToSelectedStyle() {
        sizeLabel.textColor = SizeCollectionViewCell.labelSelectedColor
        selectedView.isHidden = false
    }
    
    override func changeToUnselectedStyle() {
        sizeLabel.textColor = SizeCollectionViewCell.labelUnselectedColor
        selectedView.isHidden = true
    }
    
}
