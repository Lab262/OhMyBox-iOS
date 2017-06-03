//
//  BoxRequestTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxRequestTableViewCell: UITableViewCell {

    static var identifier: String {
        return "boxRequestTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 212 * UIView.widthScaleProportion
    }
    
    static var nibName: String {
        return "BoxRequestTableViewCell"
    }
    
    typealias Info = (title: String, categoryCount: Int, price: Double, productImages: [UIImage])
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryCountLabel: UILabel!
    @IBOutlet var productImageViews: [UIImageView]!
    
    var info: Info? {
        didSet {
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCountLabel.textColor = UIColor.mediumGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateInfo() {
        
        titleLabel.text = "BOX: \(info?.title ?? "")"
        priceLabel.text = String.stringFromPrice(price: info?.price ?? 0)
        categoryCountLabel.text = "\(info?.categoryCount ?? 0) categorias"
        
        for i in 0..<productImageViews.count {
            
            productImageViews[i].image = info?.productImages.object(at: i)
        }
    }
    
}
