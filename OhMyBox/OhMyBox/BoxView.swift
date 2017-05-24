//
//  BoxView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 04/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse
import UIKit

class BoxView: UIView {

    typealias Info = (title: String, description: String, price: Double, brandImage: UIImage, productImages: [PFFile?])
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryCountLabel: UILabel!
    
    @IBOutlet weak var brandImageView: UIImageView!
    
    @IBOutlet var productImageViews: [UIImageView]!
    
    var boxButtonHandler: UIButton.ButtonHandler?
    var likeButtonHandler: UIButton.ButtonHandler?
    
    var showsBoxButton = true
    var showsLikeButton = true
    
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
        
        boxButton.isHidden = !showsBoxButton
        likeButton.isHidden = !showsLikeButton
        
    }
    
    func updateInfo() {
        
        titleLabel.text = info?.title
        descriptionLabel.attributedText = info?.description.with(lineSpacing: -9)
        priceLabel.text = String.stringFromPrice(price: info?.price ?? 0)
        brandImageView.image = info?.brandImage
        
        let productImagesCount = info?.productImages.count ?? 0
        
        categoryCountLabel.text = "\(productImagesCount) categoria" + (productImagesCount == 1 ? "" : "s")
        
        for i in 0..<productImageViews.count {
            
            guard let file = info?.productImages.object(at: i) as? PFFile else { continue }
            productImageViews[i].loadPFFile(file)
        }
        
    }
    
    @IBAction func boxButtonAction(sender: UIButton) {
        
        boxButtonHandler?(sender)
    }
    
    @IBAction func likeButtonAction(sender: UIButton) {
        
        likeButtonHandler?(sender)
    }

    func setBoxButtonSelected(_ selected: Bool) {
        
        let image: UIImage
        if selected {
            
            image = #imageLiteral(resourceName: "box_button_selected")
        } else {
            
            image = #imageLiteral(resourceName: "box_button_gray")
        }
        boxButton.setImage(image, for: .normal)
    }
    
    func setLikeButtonSelected(_ selected: Bool) {
        
        let image: UIImage
        if selected {
            
            image = #imageLiteral(resourceName: "like_button_selected")
        } else {
            
            image = #imageLiteral(resourceName: "heart_button_gray")
        }
        likeButton.setImage(image, for: .normal)
    }
    
}
