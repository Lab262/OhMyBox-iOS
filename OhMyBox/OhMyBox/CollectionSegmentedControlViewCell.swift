//
//  CollectionSegmentedControlViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CollectionSegmentedControlViewCell: UICollectionViewCell {

    static var identifier: String {
        return "collectionSegmentedControlViewCell"
    }
    
    static var cellSize: CGSize {
        return CGSize(width: 110, height: 45) * UIView.widthScaleProportion
    }
    
    static var nibName: String {
        return "CollectionSegmentedControlViewCell"
    }
    
    var selectedLabelColor: UIColor = .white
    var selectedBackgroundColor: UIColor = .darkPurple
    var selectedLabelAlpha: CGFloat = 1
    
    var unselectedLabelColor: UIColor = .darkPurple
    var unselectedBackgroundColor: UIColor = .clear
    var unselectedLabelAlpha: CGFloat = 0.5
    
    var titleCharacterSpacing: Double = 2.71
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleBackgroundView: UIView!
    
    var title: String? {
        
        didSet {
            
            titleLabel.attributedText = title?.with(characterSpacing: titleCharacterSpacing, color: unselectedLabelColor)
        }
    }
    
    override var isSelected: Bool {
        
        didSet {
            
            if isSelected {
                changeToSelectedStyle()
            } else {
                changeToUnselectedStyle()
            }
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        titleBackgroundView.cornerRadius = 3
    }
    
    override func changeToSelectedStyle() {
        
        titleLabel.attributedText = title?.with(characterSpacing: titleCharacterSpacing, color: selectedLabelColor)
        titleLabel.alpha = selectedLabelAlpha
        titleBackgroundView.backgroundColor = selectedBackgroundColor
    }
    
    override func changeToUnselectedStyle() {
        
        titleLabel.attributedText = title?.with(characterSpacing: titleCharacterSpacing, color: unselectedLabelColor)
        titleLabel.alpha = unselectedLabelAlpha
        titleBackgroundView.backgroundColor = unselectedBackgroundColor
    }

}
