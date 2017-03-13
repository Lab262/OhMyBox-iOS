//
//  ShoppingProductTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingProductTableViewCell: UITableViewCell {

    static var identifier: String {
        return "shoppingProductTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 112
    }
    
    static var nibName: String {
        return "ShoppingProductTableViewCell"
    }
    
    typealias Info = (image: UIImage, name: String, brand: String, count: Int, price: Double)
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var info: Info? {
        didSet {
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.layer.cornerRadius = 3.0
//        updateInfo()
    }
    
    func updateInfo() {
        
        if let info = info {
            
            productImageView.image = info.image
            
            nameLabel.attributedText = info.name.with(characterSpacing: 1.5)
            brandLabel.attributedText = "By \(info.brand)".with(characterSpacing: 1.1)
            
            let pluralCountString = info.count == 1 ? "" : "s"
            let countText = "\(info.count) unidade" + pluralCountString
            countLabel.text = countText
            
            priceLabel.text = String.stringFromPrice(price: info.price)
        } else {
            productImageView.image = nil
            nameLabel.attributedText = nil
            brandLabel.attributedText = nil
            countLabel.text = nil
            priceLabel.text = nil
        }
        
    }
    
}
