//
//  ShoppingBoxTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 31/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShoppingBoxTableViewCell: UITableViewCell {
    
    static let identifier = "shoppingBoxCell"

    
    @IBOutlet weak var bgViewCell: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var lessButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameProuct: UILabel!
    var number: Int = 1
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgViewCell.layer.borderWidth = 1.5
        self.bgViewCell.layer.borderColor = UIColor.black.cgColor
        self.configureImage()
    }
    
    @IBAction func decrease(_ sender: AnyObject) {
        if (number > 1){
            number = number-1
            self.countLabel.text = String(number)

        }
        
    }
    @IBAction func increase(_ sender: AnyObject) {
        number = number+1
        self.countLabel.text = String(number)
    }
    
   
    func configureImage (){
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
