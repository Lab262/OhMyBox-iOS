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
    var tagType: Int? {
        didSet {
            self.initializeTagView()
        }
    }
    @IBOutlet weak var showCaseImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func initializeTagView(){
        
        let tagView: UIView?
        
        if tagType! == 0 {
            tagView = TagView.instanceFromNib()
            tagView?.center = CGPoint(x: self.frame.width/2-75, y: self.frame.height/2+75)
        } else {
            tagView = TagView2.instanceFromNib()
            tagView?.center = CGPoint(x: self.frame.width/2-45, y: self.frame.height/2+85)
        }
       
        self.addSubview(tagView!)
        
        
    }
}
