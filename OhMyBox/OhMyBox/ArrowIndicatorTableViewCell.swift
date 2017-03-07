//
//  ArrowIndicatorTableViewCell
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ArrowIndicatorTableViewCell: UITableViewCell {

    static var identifier: String {
        return "arrowIndicatorTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 44.0
    }
    
    static var nibName: String {
        return "ArrowIndicatorTableViewCell"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            if let title = title {
                titleLabel.attributedText = title.uppercased().with(characterSpacing: 0.84)
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
