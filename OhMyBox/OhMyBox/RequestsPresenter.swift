//
//  RequestsPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

protocol RequestsView {
    
    func reloadData()
}

class RequestsPresenter: NSObject {

    var view: RequestsView?
    
    var purchaseRequests: [PurchaseRequest] = [] {
        
        didSet {
            
            purchaseRequests.sort { (a, b) -> Bool in
                a.createdAt! > b.createdAt!
            }
            view?.reloadData()
        }
    }
    
    func loadPurchaseRequests() {
        
        guard let buyer = User.current else { return }
        
        let query = PFQuery(className: PurchaseRequest.parseClassName()).whereKey("buyer", equalTo: buyer)
        
        query.findObjectsInBackground { (objects, error) in
            
            guard let requests = (objects as? [PurchaseRequest])?.sorted(by: { (a, b) -> Bool in
                
                a.createdAt! > b.createdAt!
                
            }) else { return }
            
            
            
            self.purchaseRequests.removeAll(keepingCapacity: true)
            for request in requests {
                
                request.box.fetchInBackground(block: { (object, error) in
                    
                    guard let box = object as? Box else { return }
                    
                    request.box = box
                    self.purchaseRequests.append(request)
                })
            }
        }
    }
}
