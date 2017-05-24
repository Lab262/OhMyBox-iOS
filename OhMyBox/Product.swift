//
//  Product.swift
//  OhMyBox
//
//  Created by Felipe perius on 07/12/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import Parse

class Product: PFObject {
    
    @NSManaged var name: String
    @NSManaged var brand: Brand
    @NSManaged var productType: String
    
    var photos: [PFFile] = []
    
    var photosRelation: PFRelation<PhotoObject> {
        
        return self.relation(forKey: "photos") as! PFRelation<PhotoObject>
    }
    
    func queryPhotos(completionHandler: (([PFFile]) -> ())? = nil) {
        
        photosRelation.query().findObjectsInBackground { (objects, error) in
            
            if let objects = objects {
                
                self.photos = objects.map { $0.photo }
            }
            completionHandler?(self.photos)
        }
    }
    
    func queryPhotosSync() throws {
        
        let photoObjects = try photosRelation.query().findObjects()
        
        let photos = photoObjects.map { $0.photo }
        
        self.photos = photos
        
    }
}

extension Product: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "Product"
    }
}
