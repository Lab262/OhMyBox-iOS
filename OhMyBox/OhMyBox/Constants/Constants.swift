
//
//  File.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 02/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Foundation

struct SegueIdentifiers {
    
    // From home
    static let homeToProductDetail = "goToProductDetail"
    
    // From brands
    static let brandsToBrandDetail = "goToBrandDetail"
    
    // From brand detail
    static let brandDetailToProductDetail = "goToProductDetail"
    static let brandDetailToCollecions = "goToCollections"
    static let brandDetailToContact = "brandDetailToContact"
}


struct Notifications {
    
    static let selectHomeViewController = NSNotification.Name(rawValue: "selectHomeViewController")
}
