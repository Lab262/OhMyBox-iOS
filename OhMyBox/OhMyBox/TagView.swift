//
//  TagView.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class TagView: UIView {
    
    
@IBOutlet weak var squareBackgroundView: UIView!
@IBOutlet weak var squareForegroundView: UIView!
    
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TagView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    override func awakeFromNib() {

        //self.squareBackgroundView.layer.masksToBounds = true
        self.squareBackgroundView.layer.borderWidth = 1.8
        self.squareBackgroundView.layer.borderColor = UIColor.black.cgColor
       // self.squareForegroundView.layer.masksToBounds = true
        self.squareForegroundView.layer.borderWidth = 1.8
        self.squareForegroundView.layer.borderColor = UIColor.black.cgColor

    }
}
