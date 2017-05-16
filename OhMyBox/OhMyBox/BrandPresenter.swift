//
//  BrandPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 16/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

protocol BrandView {
    
    func reloadData()
}

class BrandPresenter: NSObject {

    var view: BrandView?
    var brands: [Brand] = [] {
        
        didSet {
            
            view?.reloadData()
        }
    }
    
    func loadBrands() {
        
        let query = PFQuery(className: Brand.parseClassName())
        query.findObjectsInBackground { (objects, error) in
            
            guard let brands = objects as? [Brand] else { return }
            
            self.brands = brands
        }
    }
}
