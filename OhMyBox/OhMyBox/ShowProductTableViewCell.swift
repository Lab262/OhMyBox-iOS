//
//  ShowProductTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 30/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShowProductTableViewCell: UITableViewCell {

    
    static let cellHeight: CGFloat = 472.0
    static let identifier = "productTableCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var boxButton: UIButton!
    
    var brandName: String? {
        didSet {
            if let brandName = brandName {
                brandNameLabel.attributedText = brandName.with(characterSpacing: 1.0)
            } else {
                brandNameLabel.attributedText = nil
            }
        }
    }
    
    var productName: String? {
        didSet {
            productNameLabel.text = productName
        }
    }
    
    var price: Double? {
        didSet {
            if let price = price {
                let priceString = String(format: "R$ %.2lf", price).replacingOccurrences(of: ".", with: ",")
                priceLabel.text = priceString
            } else {
                priceLabel.text = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initializeStatesButtons()
    }


    func initializeStatesButtons() {
        
        self.likeButton.setImage(#imageLiteral(resourceName: "heartEmpty_button"), for: .normal)
        self.likeButton.setImage(#imageLiteral(resourceName: "heartFull_button"), for: .selected)
        
        self.boxButton.setImage(#imageLiteral(resourceName: "box_button"), for: .normal)
        self.boxButton.setImage(#imageLiteral(resourceName: "boxSelected_button"), for: .selected)
    }
    
    @IBAction func setFavorite(_ sender: AnyObject) {
        self.changeFavoriteButtonState()
    }
    
    func changeFavoriteButtonState() {
        if self.likeButton.isSelected {
            self.likeButton.isSelected = false
            
            self.likeButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.likeButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
            
            
        } else {
            self.likeButton.isSelected = true
            
            self.likeButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.likeButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
        }
    }
    
    func changeBoxButtonState() {
        
        if self.boxButton.isSelected {
            self.boxButton.isSelected = false
            
            self.boxButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.boxButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
            
            
        } else {
            self.boxButton.isSelected = true
            
            self.boxButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.boxButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
        }
        
    }
    @IBAction func didSelectBoxButton(_ sender: Any) {
        self.changeBoxButtonState()
    }
    
    
}
