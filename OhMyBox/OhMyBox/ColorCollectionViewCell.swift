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
    
    var colourModel: Colour! {
        didSet {
            setupCell()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.circleColor.roundToCircle()
    }
    
    func setupCell(){
        
        if self.colourModel.isSelected! {
            self.checkColor.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseInOut)
            self.checkColor.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
        } else {
            self.checkColor.alpha = 0
        }
        self.circleColor.backgroundColor = UIColor.hexStringToUIColor(hex: self.colourModel.colourHex!)
    }
    
}
