//
//  WishlistCountTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class WishlistCountTableViewCell: UITableViewCell {
   
    static var identifier: String {
        return "wishlistCountTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 44.0
    }
    
    static var nibName: String {
        return "WishlistCountTableViewCell"
    }
    
    var wishlistCount: Int = 0 {
        didSet {
            setWishlistCountTitle(wishlistCount)
        }
    }
    
    @IBOutlet weak var wishlistCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setWishlistCountTitle(wishlistCount)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setWishlistCountTitle(_ productsCount: Int) {
        if let wishlistCountLabel = wishlistCountLabel {
            wishlistCountLabel.attributedText = ("\(productsCount) boxes na Wishlist").with(characterSpacing: 2.04)
        }
    }
}
