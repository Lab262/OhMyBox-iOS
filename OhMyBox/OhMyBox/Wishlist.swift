//
//  Wishlist.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class Wishlist: PFObject {

    @NSManaged var user: User
    @NSManaged var box: Box
    
    override init() {
        super.init()
    }
    
    init(user: User, box: Box) {
        
        super.init()
        
        self.user = user
        self.box = box
    }
}

extension Wishlist: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "Wishlist"
    }
}
