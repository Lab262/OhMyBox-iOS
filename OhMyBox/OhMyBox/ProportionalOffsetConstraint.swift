//
//  ProportionalOffsetConstraint.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProportionalOffsetConstraint: NSLayoutConstraint {
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        constant *= UIView.widthScaleProportion
    }
}
