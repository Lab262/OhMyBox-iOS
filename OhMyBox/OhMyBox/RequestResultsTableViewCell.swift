//
//  RequestResultsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class RequestResultsTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "requestResultsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 100
    }
    
    static var nibName: String {
        return "RequestResultsTableViewCell"
    }
    
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var totalSeparatorLabel: UILabel!
    
    var total: Double = 0 {
        didSet {
            let totalString = String.stringFromPrice(price: total)
            totalValueLabel.attributedText = totalString.with(characterSpacing: 1.5)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTitleLabels()
    }

    func setUpTitleLabels() {
        
        var totalTitle = "Tudo isso por"
        var totalSeparator = ""
        
        let hifenCount = 18 - totalTitle.characters.count
        
        for _ in 0..<hifenCount {
            totalSeparator += "-"
        }
        
        totalTitleLabel.attributedText = totalTitle.with(characterSpacing: 1.5)
        totalSeparatorLabel.attributedText = totalSeparator.with(characterSpacing: 1.5)
    }
}
