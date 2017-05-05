//
//  PFObject+Reflection.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 05/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

extension PFObject {

    typealias ReflectionType = [String: Any]
    
    var reflectionKeys: [String] {
        
        return allKeys.flatMap { (self[$0] is PFRelation) ? nil : $0 }
    }
    
    var reflection: ReflectionType {
        
        var reflection: ReflectionType = [#keyPath(objectId): objectId ?? ""]
        
        for key in allKeys where !(self[key] is PFRelation) {
            
            reflection[key] = self[key]
        }
        
        return reflection
    }

}
