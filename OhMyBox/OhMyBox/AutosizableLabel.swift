//
//  AutosizableLabel.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class AutosizableLabel: UILabel {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        updateFontSize()
    }
    
    func updateFontSize() {
        
        font = font.withSize(font.pointSize * UIView.widthScaleProportion)
    }
}
