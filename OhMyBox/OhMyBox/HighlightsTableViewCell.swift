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
    
    weak var selectionDelegate: CollectionViewSelectionDelegate?
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

extension HighlightsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return highlights.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HighlightCollectionViewCell.identifier, for: indexPath) as! HighlightCollectionViewCell
        
        cell.imageView.image = highlights[indexPath.item]
        
        return cell
    }
}

extension HighlightsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return HighlightCollectionViewCell.cellSize
    }
}

extension HighlightsTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionDelegate?.collectionViewDelegate(self, didSelectItemAt: indexPath)
    }
}
