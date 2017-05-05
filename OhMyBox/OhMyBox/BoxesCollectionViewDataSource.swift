//
//  BoxesCollectionViewDataSource.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 20/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxesCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    weak var collectionView: UICollectionView!
    
    var collectionSelectionDelegate: CollectionViewSelectionDelegate?
    
    var boxes: [Box] = []
    
    var boxButtonHandler: ((IndexPath) -> ())?
    var likeButtonHandler: ((IndexPath) -> ())?
    
    init(collectionView: UICollectionView) {
        
        self.collectionView = collectionView
        
        super.init()
        
        setUpCollectionView()
        registerNibs()
    }
    
    func setUpCollectionView() {
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let margin: CGFloat = 9
        
        flowLayout.minimumLineSpacing = margin
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin)
    }
    
    func registerNibs() {
        
        collectionView.registerNibFrom(BoxCollectionViewCell.self)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return boxes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxCollectionViewCell.identifier, for: indexPath) as! BoxCollectionViewCell
        
        let box = boxes[indexPath.item]
        
        cell.boxView.boxButtonHandler = { _ in
            
            self.boxButtonHandler?(indexPath)
        }
        
        cell.boxView.likeButtonHandler = { _ in
            
            self.likeButtonHandler?(indexPath)
        }
        
        cell.info = (box.name!, box.boxDescription!, box.price!.doubleValue, #imageLiteral(resourceName: "brand_placeholder_image"), [#imageLiteral(resourceName: "product_placeholder"), #imageLiteral(resourceName: "product_placeholder")])
        
        cell.layer.cornerRadius = 3
        
        cell.layer.masksToBounds = false
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowRadius = 4
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
        return cell
    }
    
    func addToCart(box: Box) {
        
        
    }
}

extension BoxesCollectionViewDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionSelectionDelegate?.collectionViewDelegate(self, didSelectItemAt: indexPath)
    }
}

extension BoxesCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return BoxCollectionViewCell.cellSize
    }
}
