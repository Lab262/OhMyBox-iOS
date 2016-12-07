//
//  ShowProductCollectionViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShowProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "showProductCell"
    
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var boxButton: UIButton!
    
    
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
       let product = Product.init(_id:"1", _photo:"", _photoImage:#imageLiteral(resourceName: "defaultWoman"), _price:"R$ 50", _descriptionProduc:"teste", _detail:"aslkfjalksfj ")
        
        ApplicationState.sharedInstance.favoriteProducts.append(product)
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
