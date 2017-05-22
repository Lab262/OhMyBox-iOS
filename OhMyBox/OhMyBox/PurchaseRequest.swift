//
//  Request.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class PurchaseRequest: PFObject {
    
    @NSManaged var box: Box
    @NSManaged var buyer: User
    @NSManaged var confirmed: Bool
    
    init(box: Box, buyer: User, confirmed: Bool = false) {
        
        super.init()
        
        self.box = box
        self.buyer = buyer
        self.confirmed = confirmed
    }

}

extension PurchaseRequest: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "PurchaseRequest"
    }
}
