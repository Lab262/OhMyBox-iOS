//
//  BrandsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 03/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandsTableViewCell: UITableViewCell {

    var brands: [Brand] = [] {
        
        didSet {
            
            collectionView.reloadData()
        }
    }
    
    static var identifier: String {
        return "brandsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 274 * UIView.widthScaleProportion
    }
    
    static var nibName: String {
        return "BrandsTableViewCell"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var selectionDelegate: CollectionViewSelectionDelegate?
    
    var followButtonHandler: ((IndexPath) -> ())?
    
    let margin: CGFloat = 20.0
    let itemSpacing: CGFloat = 11.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        setUpCollectionView()
    }
    
    func registerNibs() {
        collectionView.registerNibFrom(BrandCollectionViewCell.self)
    }

    func setUpCollectionView() {
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = itemSpacing
        flowLayout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin)
    }
    
}

extension BrandsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath) as! BrandCollectionViewCell
        
        let brand = brands[indexPath.item]
        cell.info = (brand.name, brand.title, brand.photo)
        
        cell.followHandler = { _ in
            
            self.followButtonHandler?(indexPath)
        }
        
        cell.changeFollowButtonToHighlightedStyle(brandIsFollowed(brand: brand))
        
        return cell
    }
    
    func brandIsFollowed(brand: Brand) -> Bool {
        
        return FollowManager.shared.brandIsFollowed(brand)
    }
}

extension BrandsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return BrandCollectionViewCell.cellSize
    }
}

extension BrandsTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionDelegate?.collectionViewDelegate(self, didSelectItemAt: indexPath)
    }
}
