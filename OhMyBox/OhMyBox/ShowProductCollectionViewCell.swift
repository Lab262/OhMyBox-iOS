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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    @IBAction func setFavorite(_ sender: AnyObject) {
        
    }
}

