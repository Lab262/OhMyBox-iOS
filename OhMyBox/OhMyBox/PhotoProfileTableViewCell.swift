//
//  PhotoProfileTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 19/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class PhotoProfileTableViewCell: UITableViewCell {
    static let identifier = "photoProfileCell"

    @IBOutlet weak var parallaxConstraint: NSLayoutConstraint!
    @IBOutlet weak var photoProfileImage: UIImageView!
    @IBOutlet weak var nameProfileLabel: UILabel!
    internal var lastContentOffset: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
      
}

extension PhotoProfileTableViewCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
      
        
        if scrollView.contentOffset.y <= 0 {
            self.parallaxConstraint.constant = self.parallaxConstraint.constant + (self.lastContentOffset - scrollView.contentOffset.y)
        } else {
            self.parallaxConstraint.constant = 223
        }
        
        if self.parallaxConstraint.constant > 223 && scrollView.contentOffset.y >= 0  {
            self.parallaxConstraint.constant = 223
            UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.layoutIfNeeded()
                }, completion: nil)
        }
        
        
        self.lastContentOffset = scrollView.contentOffset.y
        
    }
    
    
}
