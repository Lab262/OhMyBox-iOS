//
//  ShoppingBoxTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 31/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShoppingBoxTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "shoppingBoxCell"
    }
    static var cellHeight: CGFloat {
        return 136
    }
    
    static var nibName: String {
        return "ShoppingBoxTableViewCell"
    }
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var productImageViewContainer: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productBrandNameLabel: UILabel!
    
    var productCount: Int = 1 {
        didSet {
            self.countLabel.text = String(format: "%02d", productCount)
        }
    }
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func decrease(_ sender: AnyObject) {
        if (productCount > 1){
            productCount -= 1
        }
    }
    
    @IBAction func increase(_ sender: AnyObject) {
        productCount += 1
    }
    
    @IBAction func deleteProduct(_ sender: AnyObject) {
    
        print("FOI DELETE")
    }
    
    @IBAction func setFavorite(_ sender: AnyObject) {
    
        print("FOI favorite")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.scrollView.contentSize.width = self.bounds.width + 80
    }
   
}
