//
//  Print.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 23/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse


class Print: PFObject, PFSubclassing {
    
    @NSManaged var id: String?
    @NSManaged var photoUrl: String?
    @NSManaged var amount: Int?
    
    override class func initialize() {
        self.registerSubclass()
    }
    
    static func parseClassName() -> String {
        return "Print"
    }
    
}
