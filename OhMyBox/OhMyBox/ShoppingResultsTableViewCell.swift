//
//  ShoppingResultsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingResultsTableViewCell: UITableViewCell {

    typealias Info = (discount: Double, total: Double)
    
    static var identifier: String {
        return "shoppingResultsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 88
    }
    
    static var nibName: String {
        return "ShoppingResultsTableViewCell"
    }
    
    @IBOutlet weak var discountTitleLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    
    @IBOutlet weak var discountValueLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    @IBOutlet weak var discountSeparatorLabel: UILabel!
    @IBOutlet weak var totalSeparatorLabel: UILabel!
    
    var info: Info? {
        didSet {
            if let info = info {
                
                let discountString = String(format: "%.0lf%%", info.discount)
                discountValueLabel.attributedText = discountString.with(characterSpacing: 1.5)
                
                let totalString = String.stringFromPrice(price: info.total)
                totalValueLabel.attributedText = totalString.with(characterSpacing: 1.5)
            } else {
                discountValueLabel.attributedText = nil
                totalValueLabel.attributedText = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTitleLabels()
    }

    func setUpTitleLabels() {
        
        var discountTitle = "Desconto"
        var discountSeparator = ""
        var hifenCount = 18 - discountTitle.characters.count
        for _ in 0..<hifenCount {
            discountSeparator += "-"
        }
        
        var totalTitle = "Total"
        var totalSeparator = ""
        hifenCount = 18 - totalTitle.characters.count
        for _ in 0..<hifenCount {
            totalSeparator += "-"
        }
        
        discountTitleLabel.attributedText = discountTitle.with(characterSpacing: 1.5)
        totalTitleLabel.attributedText = totalTitle.with(characterSpacing: 1.5)
        
        discountSeparatorLabel.attributedText = discountSeparator.with(characterSpacing: 1.5)
        totalSeparatorLabel.attributedText = totalSeparator.with(characterSpacing: 1.5)
    }
    
}
