//
//  BrandPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 16/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

protocol BrandView: class {
    
    func reloadData()
}

class BrandPresenter: NSObject {

    weak var view: BrandView?
    var brands: [Brand] = [] {
        
        didSet {
            
            view?.reloadData()
        }
    }
    
    func loadBrands() {
        
        let query = PFQuery(className: Brand.parseClassName())
        //query.limit = 10
        //query.whereKey(objectId, notContainedIn: brands.map { $0.objectId })
        query.findObjectsInBackground { (objects, error) in
            
            guard let brands = objects as? [Brand] else { return }
            
//            brands.forEach {
//                
//                $0.loadPhoto(completion: { (error) in
//                    
//                    self.view?.reloadData()
//                })
//            }
            
            self.brands = brands
        }
    }
    
    func brandCellInfo(for indexPath: IndexPath) -> BrandTableViewCell.Info? {
        
        guard let brand = brands.object(at: indexPath.row) else { return nil }
        
        return (brand.name, brand.title, brand.photo)
    }
}
