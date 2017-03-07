//
//  SearchHeaderTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchHeaderTableViewCell: UITableViewCell {

    static var identifier: String {
        return "searchHeaderCell"
    }
    
    static var cellHeight: CGFloat {
        return 58.0
    }
    
    static var nibName: String {
        return "SearchHeaderTableViewCell"
    }
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    var headerTitle: String? {
        didSet {
            if let headerTitle = headerTitle {
                headerTitleLabel.attributedText = headerTitle.with(characterSpacing: 1.12)
            } else {
                headerTitleLabel.attributedText = nil
            }
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
    
}
