//
//  Box.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 27/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class Box: PFObject {
    
    @NSManaged var productTypes: [String]?
    @NSManaged var price: NSNumber?
    @NSManaged var name: String?
    @NSManaged var boxDescription: String?
    
    var products: [AnyObject]?
    
}

extension Box: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "Box"
    }
}
