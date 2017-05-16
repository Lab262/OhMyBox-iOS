//
//  BrandDetailPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 16/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol BrandDetailView {
    
    typealias Info = (name: String, title: String, brandDescription: String, brandImage: UIImage?)
}

class BrandDetailPresenter: NSObject {

    var view: BrandDetailView?
    var brand: Brand?
    
    var brandInfo: BrandDetailView.Info? {
        
        guard let b = brand else { return nil }
        
        return (b.name!, b.title!, b.brandDescription!, #imageLiteral(resourceName: "brand_placeholder_image"))
    }
    
    func updateIsFollowing(_ isFollowing: Bool) {
        
    }
}
