//
//  NewsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static var identifier: String {
        return "newsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 277
    }
    
    static var nibName: String {
        return "NewsTableViewCell"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products: [Any] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        let flowLayout = collectionView.collectionViewLayout as! CenterCellCollectionViewFlowLayout
        flowLayout.centerOffset = CGPoint(x: collectionView.frame.width * 0.3, y: 0)
        
        let margin: CGFloat = 8.0
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin)
        flowLayout.minimumLineSpacing = margin
    }
    
    func registerNibs() {
        collectionView.registerNibFrom(HighlightCollectionViewCell.self)
    }
}

extension NewsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HighlightCollectionViewCell.identifier, for: indexPath) as! HighlightCollectionViewCell
        
        cell.imageView.image = highlights[indexPath.item]
        
        return cell
    }
}

extension NewsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return HighlightCollectionViewCell.cellSize
    }
}
