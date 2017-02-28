//
//  ShowCaseCollectionViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShowCaseCollectionViewCell: UICollectionViewCell {

    enum TagViewType {
        case one
        case two
        case three
        case four
        case five
        case none
        
        var size: CGSize {
            
            let s: CGSize
            
            switch self {
            case .one: s = CGSize(width: 246 * UIView.widthScaleProportion(), height: 66 * UIView.widthScaleProportion())
            case .two: s = CGSize(width: 303 * UIView.widthScaleProportion(), height: 75 * UIView.widthScaleProportion())
            case .three: s = CGSize(width: 246 * UIView.widthScaleProportion(), height: 72 * UIView.widthScaleProportion())
            case .four: s = CGSize(width: 284 * UIView.widthScaleProportion(), height: 89 * UIView.widthScaleProportion())
            case .five: s = CGSize(width: 232 * UIView.widthScaleProportion(), height: 83 * UIView.widthScaleProportion())
            case .none: s = CGSize()
            }
            
            return s
        }
        
        var leadingConstant: CGFloat {
            return 6.0
        }
    }
    
    static var identifier: String {
        return "showCaseCell"
    }
    var followingClothes = false
    
    var tagView: UIView!
    
    var tagType: TagViewType! {
        didSet {
           self.initializeTagView()
        }
    }
    @IBOutlet weak var showCaseImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createTagConstraints(tagView, tagType.leadingConstant)
    }
    
    func initializeTagView() {
        
        switch tagType! {
        case .one:
            
            let tagView1 = TagView1.instanceFromNib() as! TagView1
            tagView1.frame = CGRect(origin: CGPoint(), size: tagType.size)
            
            tagView = tagView1
            
        case .two:
            
            let tagView2 = TagView2.instanceFromNib() as! TagView2
            tagView2.frame = CGRect(origin: CGPoint(), size: tagType.size)
            
            tagView = tagView2
            
        case .three:
            
            let tagView3 = TagView3.instanceFromNib() as! TagView3
            tagView3.frame = CGRect(origin: CGPoint(), size: tagType.size)
            
            tagView = tagView3
            
        case .four:
            
            let tagView4 = TagView4.instanceFromNib() as! TagView4
            tagView4.frame = CGRect(origin: CGPoint(), size: tagType.size)
            tagView4.collectionBrandName.text = "Neon Go"
            
            tagView = tagView4
            
        case .five:
            
            let tagView5 = TagView5.instanceFromNib() as! TagView5
            tagView5.frame = CGRect(origin: CGPoint(), size: tagType.size)
            tagView5.nameTagLabel.text = "VERÃO DE SAIAS"
            
            tagView = tagView5
            
        case .none:
            tagView = nil
        }
        
        if let tagView = tagView {
            addSubview(tagView)
        }
    }
    
    func createTagConstraints(_ tag: UIView, _ leadingConstant: CGFloat) {
        
        let bottomConstraint = NSLayoutConstraint(item: tag, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: leadingConstant)
        bottomConstraint.isActive = true
        
        tag.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tag.translatesAutoresizingMaskIntoConstraints = false
        tag.layoutIfNeeded()
    }
}
