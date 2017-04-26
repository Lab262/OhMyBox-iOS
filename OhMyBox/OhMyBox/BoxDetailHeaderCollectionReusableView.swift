//
//  BoxDetailHeaderCollectionReusableView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 25/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxDetailHeaderCollectionReusableView: UICollectionReusableView {

    static var nibName: String {
        
        return "BoxDetailHeaderCollectionReusableView"
    }
    
    static var identifier: String {
        
        return "boxDetailHeaderCollectionReusableView"
    }
    
    static var viewSize: CGSize {
        
        return CGSize(width: 375, height: 345) * UIView.heightScaleProportion()
    }
    
    static let categoriesCountTitle: String = "essa box tem"
    
    typealias Info = (name: String, description: String, price: Double, categories: [String])
    
    @IBOutlet weak var titleBackgroundImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var separatorView: UIView!

    @IBOutlet weak var collectionPickerView: CollectionPickerView!
    
    @IBOutlet weak var categoriesCountTitleLabel: UILabel!
    @IBOutlet weak var categoriesCountLabel: UILabel!
    @IBOutlet weak var optionCountLabel: UILabel!
    
    var info: Info? {
        
        didSet {
            
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        categoriesCountLabel.attributedText = BoxDetailHeaderCollectionReusableView.categoriesCountTitle.with(characterSpacing: 1.12, color: UIColor.darkPurple)
        
        collectionPickerView.showsIndicator = false
    }
    
    func updateInfo() {
        
        nameLabel.attributedText = info?.name.with(characterSpacing: 1.12, color: UIColor.darkPurple)
        
        descriptionLabel.attributedText = info?.name.with(characterSpacing: 1.22, color: UIColor.colorWithHexString("8F8F8F"))
        
        priceLabel.attributedText = String.stringFromPrice(price: info?.price ?? 0).with(characterSpacing: 1.12, color: UIColor.darkPurple)
        
        categoriesCountLabel.attributedText = "\(info?.categories.count ?? 0) categorias".with(characterSpacing: 1.12, color: UIColor.darkPurple)
    }
    
    override func prepareForReuse() {
        
        collectionPickerView.optionIndicatorImageView.isHidden = true
    }
    
}
