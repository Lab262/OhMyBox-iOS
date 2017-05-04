//
//  BoxCollectionViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 20/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxCollectionViewCell: UICollectionViewCell {
    
// MARK: Setup
    
    static var identifier: String {
        return "boxCollectionViewCell"
    }
    
    static var cellSize: CGSize {
        return CGSize(width: 345, height: 240) * UIView.widthScaleProportion()
    }
    
    static var nibName: String {
        return "BoxCollectionViewCell"
    }
    
// MARK: Outlets
    
    @IBOutlet weak var boxView: BoxView!
    
    var info: BoxView.Info? {
        
        didSet {
            
            boxView.info = info
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }

}
