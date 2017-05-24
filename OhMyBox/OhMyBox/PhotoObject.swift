//
//  PhotoObject.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 24/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class PhotoObject: PFObject {

    @NSManaged var photo: PFFile
}

extension PhotoObject: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "PhotoObject"
    }
}
