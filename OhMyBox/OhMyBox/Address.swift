//
//  Address.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 05/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

class Address: PFObject {
    
    @NSManaged var addressDescription: String?
    @NSManaged var complement: String?
    @NSManaged var neighborhood: String?
    @NSManaged var cep: String?
    @NSManaged var city: String?
    @NSManaged var state: String?
    @NSManaged var country: String?
}

extension Address: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "Address"
    }
}
