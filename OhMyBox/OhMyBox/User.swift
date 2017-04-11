//
//  User.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 10/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import Parse

class User: PFUser {
    
    enum UserType: String {
        
        case buyer
        case seller
    }
    
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var userType: String?
    @NSManaged var photo: PFFile?
    
    static var current: User? {
        
        return PFUser.current() as? User
    }
    
    var fullName: String {
        
        if case let (firstName?, lastName?) = (firstName, lastName) {
            return "\(firstName) \(lastName)"
        } else {
            return ""
        }
    }
}
