//
//  ProductDetailPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 25/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol ProductDetailView: class {
    
    func reloadData()
}

class ProductDetailPresenter: NSObject {

    weak var view: ProductDetailView?
    var product: Product!
    
    var productBrandIsFollowed: Bool {
        
        return FollowManager.shared.brandIsFollowed(product.brand)
    }
    
    override init() {
        
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(followsUpdated), name: Notifications.followsUpdated, object: nil)
    }
    
    func followsUpdated() {
        
        view?.reloadData()
    }
    
    func updateFollowProductBrand() {
        
        FollowManager.shared.updateFollows(withBrand: product.brand)
    }
}
