//
//  PurchasePresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

protocol PurchaseView: class {
    
    func purchaseRequestSaved(success: Bool, error: Error?)
}

class PurchasePresenter: NSObject {

    weak var view: PurchaseView?
    
    var box: Box?
    var productsCount: Int {
        
        return box?.productTypes.count ?? 0
    }
    
    func selectedProduct(for category: String) -> Product? {
        
        let products = box?.products.filter {
            $0.productType == category
        }
        
        return products?.object(at: 0)
    }
    
    func sendPurchaseRequest() {
        
        guard let buyer = User.current else { return }
        guard box != nil else { return }
        
        let request = PurchaseRequest(box: box!, buyer: buyer)
        request.saveInBackground(block: { (success, error) in
            
            print("REQ SAVED?: ", success)
            self.view?.purchaseRequestSaved(success: success, error: error)
        })
    }
}
