//
//  Holder.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 15/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import ObjectMapper


class Holder: NSObject, Mappable {
    
    var fullname: String?
    var birthdate: String?
    var taxDocument: TaxDocument?
    var phone: Phone?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        fullname <- map[HolderKeys.fullname]
        birthdate <- map[HolderKeys.birthdate]
        taxDocument <- map[HolderKeys.taxDocument]
        phone <- map[HolderKeys.phone]
    }
}
