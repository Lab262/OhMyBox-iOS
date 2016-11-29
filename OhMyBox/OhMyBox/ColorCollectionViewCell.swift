//
//  ColorCollectionViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 24/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
      static let identifier = "ColorCollectionCell"
    @IBOutlet weak var circleInternal: UIView!
    @IBOutlet weak var circleColor: UIView!
    @IBOutlet weak var checkColor: UIImageView!

    override func layoutSubviews() {
        super.layoutSubviews()
        self.circleColor.roundToCircle()
    }
    
}
