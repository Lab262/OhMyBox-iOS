//
//  PFObject+Reflection.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 05/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

extension PFObject {

    var reflection: [String: Any] {
        
        var reflection: [String: Any] = [#keyPath(objectId): objectId ?? ""]
        
        for key in allKeys {
            
            reflection[key] = self[key]
        }
        
        return reflection
    }
    
    convenience init?(reflection: [String: Any]) {
        
        self.init()
        
        let reflectionKeySet = Set(reflection.keys)
        let allKeySet = Set(allKeys)
        
        guard reflectionKeySet.isSubset(of: allKeySet) else {
            
            return nil
        }
        
        for (key, value) in reflection {
            
            self[key] = value
        }
    }
}
