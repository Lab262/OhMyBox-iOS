//
//  HighlightsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class HighlightsTableViewCell: UITableViewCell {

    static var identifier: String {
        return "highlightsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 360
    }
    
    static var nibName: String {
        return "HighlightsTableViewCell"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var highlights: [UIImage] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        let flowLayout = collectionView.collectionViewLayout as! CenterCellCollectionViewFlowLayout
        flowLayout.centerOffset = CGPoint(x: collectionView.frame.width/2, y: 0)
        
        let margin: CGFloat = 12.0
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin)
        flowLayout.minimumLineSpacing = margin
    }
    
    func registerNibs() {
        collectionView.registerNibFrom(HighlightCollectionViewCell.self)
    }
    
}
