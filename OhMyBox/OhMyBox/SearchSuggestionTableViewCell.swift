//
//  SearchSuggestionTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchSuggestionTableViewCell: UITableViewCell {

    static var identifier: String {
        return "searchSuggestionCell"
    }
    
    @IBOutlet weak var suggestionTitleLabel: UILabel!
    
    var suggestionTitle: String? {
        didSet {
            if let suggestionTitle = suggestionTitle {
                suggestionTitleLabel.attributedText = suggestionTitle.with(characterSpacing: 0.78)
            } else {
                suggestionTitleLabel.attributedText = nil
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
