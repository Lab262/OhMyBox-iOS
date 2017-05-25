//
//  Brand.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 16/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class Brand: PFObject {

    @NSManaged var name: String
    @NSManaged var title: String
    @NSManaged var brandDescription: String
    @NSManaged var photo: PFFile
    
    var loadedPhoto: UIImage?
    
    func loadPhoto(completion: @escaping (Error?) -> ()) {
        
        photo.getDataInBackground(block: { (data, error) in
            
            if let data = data {
                
                self.loadedPhoto = UIImage(data: data)
            }
            
            completion(error)
        })
    }
    
}

extension Brand: PFSubclassing {
    
    public static func parseClassName() -> String {
        
        return "Brand"
    }
}
