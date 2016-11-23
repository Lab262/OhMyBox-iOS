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
    var followingClothes = false
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
        
        if tagType! == 0 {
            let tagView = TagView.instanceFromNib()
            tagView.center = CGPoint(x: self.frame.width/2-45, y: self.frame.height/2+125)
            self.addSubview(tagView)
        } else if tagType! == 1 {
            let tagView2 = TagView2.instanceFromNib() as! TagView2
            
            tagView2.center = CGPoint(x: self.frame.width/1.95, y: self.frame.height/1.25)
            tagView2.followButton.isSelected = followingClothes
            tagView2.setInitialButtonState()
            self.addSubview(tagView2)
            
        } else if tagType! == 2 {
            let tagView3 = TagView3.instanceFromNib()
            tagView3.center = CGPoint(x: self.frame.width/3.25, y: self.frame.height/1.25)
            self.addSubview(tagView3)
        } else if tagType! == 3 {
            let tagView4 = TagView4.instanceFromNib() as! TagView4
            tagView4.center = CGPoint(x: self.frame.width/2.45, y: self.frame.height/1.25)
            tagView4.collectionBrandName.text = "Neon Go"
            self.addSubview(tagView4)
        } else {
            let tagView5 = TagView5.instanceFromNib() as! TagView5
            tagView5.center = CGPoint(x: self.frame.width/2.55, y: self.frame.height/1.25)
            tagView5.nameTagLabel.text = "VERÃO DE SAIAS"
    
            self.addSubview(tagView5)
        }
    }
}
