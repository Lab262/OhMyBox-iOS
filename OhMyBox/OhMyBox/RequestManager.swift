//
//  RequestManager.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse



class RequestManager: NSObject {
    
    private static var instances: [String: RequestManager] = [:] as! [String : RequestManager]
    
    static func shared(type: PFObject.Type) -> RequestManager {
        
        let className = (type.self as! PFSubclassing.Type).parseClassName()
        
        if instances[className] == nil {
            
            instances[className] = RequestManager(type: type)
        }
        
        return instances[className]!
    }
    
    var type: PFObject.Type
    
    init(type: PFObject.Type) {
        self.type = type
    }
    
    
}
