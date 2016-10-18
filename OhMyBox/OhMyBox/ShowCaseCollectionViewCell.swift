//
//  ShowCaseCollectionViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShowCaseCollectionViewCell: UICollectionViewCell {

    static let identifier = "showCaseCell"
    @IBOutlet weak var showCaseImage: UIImageView!
    @IBOutlet weak var tagView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tagView = TagView.instanceFromNib()
        self.addSubview(tagView)
        tagView.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
    }
}
