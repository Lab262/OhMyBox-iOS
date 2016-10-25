//
//  ContainerCollectionView.swift
//  OhMyBox
//
//  Created by Felipe perius on 25/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ContainerCollectionView: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ContainerCollectionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    override func awakeFromNib() {
        
    }

}
