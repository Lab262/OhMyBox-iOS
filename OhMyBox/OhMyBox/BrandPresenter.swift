//
//  BrandPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 16/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

protocol BrandView: class {
    
    func reloadData()
}

class BrandPresenter: NSObject {

    weak var view: BrandView?
    var brands: [Brand] = [] {
        
        didSet {
            
            view?.reloadData()
        }
    }
    
    var followedBrands: [Brand] {
        
        return FollowManager.shared.followedBrandsIds.flatMap { id in
            
            return brands.where {
                $0.objectId == id
            }
        }
    }
    
    override init() {
        
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(followsUpdated), name: Notifications.followsUpdated, object: nil)
    }
    
    func loadBrands() {
        
        let query = PFQuery(className: Brand.parseClassName())
        query.findObjectsInBackground { (objects, error) in
            
            guard let brands = objects as? [Brand] else { return }
            
            self.brands = brands
        }
    }
    
    func brandCellInfo(for indexPath: IndexPath) -> BrandTableViewCell.Info? {
        
        guard let brand = brands.object(at: indexPath.row) else { return nil }
        
        return (brand.name, brand.title, brand.photo)
    }
    
    func isBrandFollowed(at indexPath: IndexPath) -> Bool {
        
        guard let brand = brands.object(at: indexPath.row) else { return false }
        
        return FollowManager.shared.brandIsFollowed(brand)
    }
    
    func followButtonHandler(at indexPath: IndexPath) {
        
        guard let brand = brands.object(at: indexPath.row) else { return }
        
        FollowManager.shared.updateFollows(withBrand: brand)
    }
    
    func followButtonHandlerForFollowedBrand(at indexPath: IndexPath) {
        
        guard let brand = followedBrands.object(at: indexPath.item) else { return }
        
        FollowManager.shared.updateFollows(withBrand: brand)
    }
    
    func followsUpdated() {
        
        view?.reloadData()
    }
}
