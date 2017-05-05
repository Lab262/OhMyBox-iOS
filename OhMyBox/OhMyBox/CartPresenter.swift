//
//  CartPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 05/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol CartView {
    
    func reloadData()
}

class CartPresenter: NSObject {

    var view: CartView?
    
    var boxes: [Box] {
        
        return CartManager.shared.cartBoxes
    }
}
