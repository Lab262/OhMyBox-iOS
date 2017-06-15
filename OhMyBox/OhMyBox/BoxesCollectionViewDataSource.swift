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
    
    init(collectionView: UICollectionView) {
        
        self.collectionView = collectionView
        
        super.init()
        
        setUpCollectionView()
        registerNibs()
        
        NotificationCenter.default.addObserver(self, selector: #selector(cartUpdated(_:)), name: Notifications.cartUpdated, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(wishlistUpdated), name: Notifications.wishlistUpdated, object: nil)
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
            self.likeButtonHandler(indexPath)
        }
        
        let isInCart = CartManager.shared.boxIsInCart(box)
        cell.boxView.setBoxButtonSelected(isInCart)
        
        let isInWishlist = WishlistManager.shared.boxIsInWishlist(box)
        cell.boxView.setLikeButtonSelected(isInWishlist)
        
        
        cell.info = (box.name, box.boxDescription, box.price.doubleValue, box.brand.photo, box.products.map { $0.photos.object(at: 0) })
        
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
    
    func cartUpdated(_ notification: Notification) {
        
        guard let userInfo = notification.object as? [String: Any] else { return }
        
        guard let boxId = userInfo[CartManager.UpdateUserInfoKeys.boxId] as? String else { return }
        guard let isInCart = userInfo[CartManager.UpdateUserInfoKeys.isInCart] as? Bool else { return }
        
        let i = boxes.indexOfElement { $0.objectId ?? "" == boxId }
        
        if let i = i {
            
            guard let cell = collectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? BoxCollectionViewCell else { return }
            
            cell.boxView.setBoxButtonSelected(isInCart)
        }
    }
    
    func wishlistUpdated() {
        
        for (i, box) in boxes.enumerated() {
            
            guard let cell = collectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? BoxCollectionViewCell else { return }
            
            let isInWishlist = WishlistManager.shared.boxIsInWishlist(box)
            
            cell.boxView.setLikeButtonSelected(isInWishlist)
        }
    }
    
    func likeButtonHandler(_ indexPath: IndexPath) {
        
        let box = boxes[indexPath.row]
        WishlistManager.shared.updateWishlist(withBox: box)
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
