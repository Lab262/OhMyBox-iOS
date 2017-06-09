//
//  PurchaseRating.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class PurchaseRating: PFObject {
    
    @NSManaged var rating: NSNumber
    @NSManaged var purchaseRequest: PurchaseRequest
    @NSManaged var buyer: User
    @NSManaged var brand: Brand
    
    var feedbackOptions: PFRelation<PurchaseRatingFeedback> {
        return self.relation(forKey: feedbackOptionsRelationKey) as! PFRelation<PurchaseRatingFeedback>
    }
    
    private let feedbackOptionsRelationKey = "feedbackOptions"
    
    init(buyer: User, brand: Brand, purchaseRequest: PurchaseRequest) {
        
        super.init()
        
        self.buyer = buyer
        self.brand = brand
        self.purchaseRequest = purchaseRequest
    }
}

extension PurchaseRating: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "PurchaseRating"
    }
}
