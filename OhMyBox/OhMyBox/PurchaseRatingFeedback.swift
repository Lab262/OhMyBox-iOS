//
//  PurchaseRatingFeedback.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class PurchaseRatingFeedback: PFObject {

    @NSManaged var title: String
    @NSManaged var rating: NSNumber
    
}

extension PurchaseRatingFeedback: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "PurchaseRatingFeedback"
    }
}
