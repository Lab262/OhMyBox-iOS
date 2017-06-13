//
//  BrandCollectionsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 06/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandCollectionsTableViewCell: UITableViewCell {

    static var identifier: String {
        return "brandCollectionsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 283 * UIView.widthScaleProportion
    }
    
    static var nibName: String {
        return "BrandCollectionsTableViewCell"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var selectionDelegate: CollectionViewSelectionDelegate?
    
    var collections: [Any] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        setUpCollectionView()
        // Initialization code
    }
    
    func registerNibs() {
        collectionView.registerNibFrom(BrandCollectionCollectionViewCell.self)
    }

    func setUpCollectionView() {
        let flowLayout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 13.0, bottom: 0, right: 13.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BrandCollectionsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionCollectionViewCell.identifier, for: indexPath) as! BrandCollectionCollectionViewCell
        cell.shadowColor = .black
        cell.shadowRadius = 2.0
        cell.shadowOpacity = 0.33
        //setup cell
        
        return cell
    }
}

extension BrandCollectionsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return BrandCollectionViewCell.cellSize
    }
}

extension BrandCollectionsTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionDelegate?.collectionViewDelegate(self, didSelectItemAt: indexPath)
    }
}
