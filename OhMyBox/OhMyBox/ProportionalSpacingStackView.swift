//
//  ProportionalSpacingStackView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProportionalSpacingStackView: UIStackView {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        spacing *= UIView.widthScaleProportion
    }

}
