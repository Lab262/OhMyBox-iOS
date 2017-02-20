//
//  TagView.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class TagView1: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TagView1", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TagView1
    }
    
    override func awakeFromNib() {

    }
}
