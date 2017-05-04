//
//  BoxView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 04/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxView: UIView {

    typealias Info = (title: String, description: String, price: Double, brandImage: UIImage, productImages: [UIImage])
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryCountLabel: UILabel!
    
    @IBOutlet weak var brandImageView: UIImageView!
    
    @IBOutlet var productImageViews: [UIImageView]!
    
    var info: Info? {
        
        didSet {
            
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        if Bundle.main.loadNibNamed("BoxView", owner: self, options: nil) != nil {
            view.frame = bounds
            addSubview(view)
        }
        
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
