//
//  Box.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 27/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class Box: PFObject {
    
    @NSManaged var productTypes: [String]
    @NSManaged var price: NSNumber
    @NSManaged var name: String
    @NSManaged var boxDescription: String
    @NSManaged var brand: Brand
    
    var products: [Product] = []
    
    var productsRelation: PFRelation<Product> {
        
        return self.relation(forKey: "products") as! PFRelation<Product>
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        
        if let object = object as? Box {
            
            return objectId != nil && object.objectId == self.objectId
        } else {
            
            return super.isEqual(object)
        }
    }
    
    func queryProducts(completionHandler: (([Product]?) -> ())? = nil) {
        
        productsRelation.query().findObjectsInBackground { (products, error) in
            
            if let products = products {
                
                self.products = products
                for product in self.products {
                    
                    do {
                        try product.queryPhotosSync()
                    } catch {
                        
                    }
                }
            }
            completionHandler?(products)
        }
    }
}

extension Box: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "Box"
    }
}
