//
//  PurchaseInfoTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PurchaseInfoTableViewCell: UITableViewCell {

    typealias Info = (title: String, value: String)
    
    static var identifier: String {
        return "purchaseInfoTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return UITableViewAutomaticDimension
    }
    
    static var nibName: String {
        return "PurchaseInfoTableViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    var info: Info? {
        didSet {
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        setSeparatorHidden(false)
    }
    
    override func setSeparatorHidden(_ hidden: Bool) {
        separatorView.isHidden = hidden
    }
    
    func updateInfo() {
        titleLabel.attributedText = info?.title.with(characterSpacing: 0.89)
        infoLabel.attributedText = info?.value.with(characterSpacing: 1.5)
    }
}
