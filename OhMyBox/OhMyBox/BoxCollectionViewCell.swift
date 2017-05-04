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
    
    typealias Info = (title: String, description: String, price: Double, brandImage: UIImage, productImages: [UIImage])
    
// MARK: Outlets
    
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var brandImageView: UIImageView!
    
    @IBOutlet var productImageViews: [UIImageView]!
    
    var info: Info? {
        
        didSet {
            
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        brandImageView.layer.cornerRadius = 3
        
    }
    
    func updateInfo() {
        
        titleLabel.text = info?.title
        descriptionLabel.attributedText = info?.description.with(lineSpacing: -9)
        priceLabel.text = String.stringFromPrice(price: info?.price ?? 0)
        brandImageView.image = info?.brandImage
        
        for i in 0..<productImageViews.count {
                
            productImageViews[i].image = info?.productImages.object(at: i)
        }
        
    }

}
