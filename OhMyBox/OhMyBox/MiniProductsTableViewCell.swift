//
//  NewsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class MiniProductsTableViewCell: UITableViewCell {

    static var identifier: String {
        return "miniProductsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 277
    }
    
    static var nibName: String {
        return "MiniProductsTableViewCell"
    }
    
    weak var selectionDelegate: CollectionViewSelectionDelegate?
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
        collectionView.registerNibFrom(MiniProductCollectionViewCell.self)
    }
}

extension MiniProductsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiniProductCollectionViewCell.identifier, for: indexPath) as! MiniProductCollectionViewCell
        
        // set cell product
        
        return cell
    }
}



extension MiniProductsTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionDelegate?.collectionViewDelegate(self, didSelectItemAt: indexPath)
    }
}
