//
//  CartPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 05/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

protocol CartView: class {
    
    func reloadData()
}

class CartPresenter: NSObject {

    weak var view: CartView?
    
    var boxes: [Box] {
        
        return CartManager.shared.cartBoxes
    }
    
    override init() {
        
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(boxesLoaded), name: Notifications.boxesLoaded, object: nil)
    }
    
    func boxesLoaded() {
        
        view?.reloadData()
    }
    
    
}
