//
//  PFFile+Util.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 06/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

private var loadedDataKey: Int8 = 1

extension PFFile {
    
    var loadedData: Data? {
        
        get {
            
            return objc_getAssociatedObject(self, &loadedDataKey) as? Data
        }
        
        set {
            
            objc_setAssociatedObject(self, &loadedDataKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
