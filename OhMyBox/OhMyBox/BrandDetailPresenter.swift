//
//  BrandDetailPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 16/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse
import UIKit

protocol BrandDetailView: class {
    
    typealias Info = (name: String, title: String, brandDescription: String, brandImageFile: PFFile)
    
    func reloadData()
}

class BrandDetailPresenter: NSObject {

    weak var view: BrandDetailView?
    var brand: Brand?
    var boxes: [Box] = [] {
        
        didSet {
            view?.reloadData()
        }
    }
    
    var brandInfo: BrandDetailView.Info? {
        
        guard let b = brand else { return nil }
        
        return (b.name, b.title, b.brandDescription, b.photo)
    }
    
    func loadBoxes() {

        let boxes = BoxRequester.shared.boxes.filter { $0.brand.objectId == self.brand?.objectId }
        
        self.boxes = boxes
        
//        let query = PFQuery(className: Box.parseClassName()).whereKey("brand", equalTo: brand)
//        
//        query.findObjectsInBackground { (objects, error) in
//            
//            if let objects = objects as? [Box] {
//                
//                self.boxes = objects
//            }
//        }
    }
    
    func updateIsFollowing(_ isFollowing: Bool) {
        
    }
}
