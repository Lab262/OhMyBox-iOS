//
//  ShoppingStatusTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 10/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingStatusTableViewCell: UITableViewCell {

    typealias Info = (date: Date, status: String) // Status should be enum value
    
    static var identifier: String {
        return "shoppingStatusTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 81
    }
    
    static var nibName: String {
        return "ShoppingStatusTableViewCell"
    }
    
    @IBOutlet weak var madeAtTitleLabel: UILabel!
    @IBOutlet weak var statusTitleLabel: UILabel!
    
    @IBOutlet weak var madeAtLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    
    var info: Info? {
        didSet {
            updateInfo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateFormatter.dateFormat = "dd/MM/YY"
        timeFormatter.dateFormat = "HH:mm"
        
        setUpTitleLabels()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpTitleLabels() {
        madeAtTitleLabel.attributedText = madeAtTitleLabel.text?.with(characterSpacing: 1.5)
        statusTitleLabel.attributedText = statusTitleLabel.text?.with(characterSpacing: 1.5)
    }
    
    func updateInfo() {
        
        if let info = info {
            madeAtLabel.attributedText = ": \(dateFormatter.string(from: info.date)) às \(timeFormatter.string(from: info.date))".with(characterSpacing: 1.5)
            statusLabel.attributedText = ": \(info.status)".with(characterSpacing: 1.5)
        } else {
            madeAtLabel.attributedText = nil
            statusLabel.attributedText = nil
        }
    }
    
}
