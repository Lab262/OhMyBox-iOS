//
//  BoxProductTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxProductTableViewCell: UITableViewCell {

    static var identifier: String {
        return "boxProductTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 130
    }
    
    static var nibName: String {
        return "BoxProductTableViewCell"
    }
    
    typealias Info = (name: String, brandName: String, size: String, printColor: UIColor, productImage: UIImage?)
    
    @IBOutlet weak var borderView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    
    @IBOutlet weak var sizeTitleLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var printTitleLabel: UILabel!
    @IBOutlet weak var printView: PrintView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var info: Info? {
        
        didSet {
            
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sendSubview(toBack: borderView)
        borderView.layer.zPosition = -1
        sizeTitleLabel.textColor = UIColor.mediumGray
        printTitleLabel.textColor = UIColor.mediumGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateInfo() {
        
        nameLabel.text = info?.name
        brandNameLabel.attributedText = info?.brandName.with(characterSpacing: 1.75, color: UIColor.mediumGray)
        sizeLabel.text = info?.size
        printView.color = info?.printColor ?? UIColor.clear
        
        photoImageView.image = info?.productImage
    }
    
}
