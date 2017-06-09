//
//  RequestsPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

protocol RequestsView: class {
    
    func reloadData()
}

class RequestsPresenter: NSObject {

    weak var view: RequestsView?
    
    var purchaseRequests: [PurchaseRequest] = [] {
        
        didSet {
            
            purchaseRequests.sort { $0.createdAt! > $1.createdAt! }
            view?.reloadData()
        }
    }
    
    func selectedProduct(for category: String) -> Product? {
        
        let products = selectedRequest?.box.products.filter {
            $0.productType == category
        }
        
        return products?.object(at: 0)
    }
    
    var selectedRequest: PurchaseRequest?
    
    func loadPurchaseRequests() {
        
        guard let buyer = User.current else { return }
        
        let query = PFQuery(className: PurchaseRequest.parseClassName()).whereKey("buyer", equalTo: buyer)
        
        query.findObjectsInBackground { (objects, error) in
            
            guard let requests = objects as? [PurchaseRequest] else { return }
            
            var requestsToRemove: [PurchaseRequest] = []
            requests.forEach { request in
                
                let requestBoxes = BoxRequester.shared.boxes.filter {
                    
                    return $0.objectId == request.box.objectId
                }
                
                if let box = requestBoxes.object(at: 0) {
                    
                    request.box = box
                } else {
                    
                    do {
                        try request.box.fetch()
                    } catch {
                        
                        requestsToRemove.append(request)
                    }
                }
            }
            
            self.purchaseRequests = requests.filter { request in
                
                return !requestsToRemove.contains {
                    
                    $0.objectId == request.objectId
                }
            }
        }
    }
}
