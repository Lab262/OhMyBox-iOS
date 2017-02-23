//
//  SearchSuggestionsHeaderTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchSuggestionsHeaderTableViewCell: UITableViewCell {

    static let identifier = "searchSuggestionHeaderCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var headerTitle: String? {
        didSet {
            if let headerTitle = headerTitle {
                titleLabel.attributedText = headerTitle.with(characterSpacing: 0.78)
            } else {
                titleLabel.attributedText = nil
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
