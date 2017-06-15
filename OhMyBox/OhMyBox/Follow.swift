//
//  Follow.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 15/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class Follow: PFObject {
    
    @NSManaged var follower: User
    @NSManaged var followed: Brand
    
    override init() {
        
        super.init()
    }
    
    init(follower: User, followed: Brand) {
        
        super.init()
        
        self.follower = follower
        self.followed = followed
    }
}

extension Follow: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "Follow"
    }
}
