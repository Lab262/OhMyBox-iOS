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
    @NSManaged var cpf: String?
    @NSManaged var phone: String?
    @NSManaged var moipId: String?
    
    var adresses: PFRelation<Address> {
        return self.relation(forKey: "adresses") as! PFRelation<Address>
    }
    
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
