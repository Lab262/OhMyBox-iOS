//
//  Product.swift
//  OhMyBox
//
//  Created by Felipe perius on 07/12/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class Product: NSObject {
    
    var id: String?
    var photo: String?
    var photoImage: UIImage?
    var price: String?
    var descriptionProduc: String?
    var detail: String?
    
 
    
    
    required init(data: (Dictionary<String, AnyObject>)) {
        super.init()
        
      
    }
 
    
    override init() {
        super.init()
    }
    
    init (_id: String, _photo: String, _photoImage:UIImage, _price: String, _descriptionProduc: String, _detail: String) {
        
        self.id = _id
        self.photo = _photo
        self.photoImage = _photoImage
        self.price = _price
        self.descriptionProduc = _descriptionProduc
        self.detail = _detail
        
    }
}
