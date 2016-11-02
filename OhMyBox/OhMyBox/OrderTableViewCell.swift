//
//  OrderTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
      static let identifier = "orderCell"

    @IBOutlet weak var orderImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var unitProduct: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var bgOrderView: UIView!
  
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgOrderView.layer.borderWidth = 1
        self.bgOrderView.layer.borderColor = UIColor.black.cgColor

    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
