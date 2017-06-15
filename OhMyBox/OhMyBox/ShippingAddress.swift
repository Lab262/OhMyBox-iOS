//
//  ShippingAddress.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import ObjectMapper

class ShippingAddress: NSObject, Mappable {
    var zipCode: String?
    var street: String?
    var streetNumber: String?
    var complement: String?
    var city: String?
    var district: String?
    var state: String?
    var country: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        zipCode <- map[ShippingAddressKeys.zipCode]
        street <- map[ShippingAddressKeys.street]
        streetNumber <- map[ShippingAddressKeys.streetNumber]
        complement <- map[ShippingAddressKeys.complement]
        city <- map[ShippingAddressKeys.city]
        district <- map[ShippingAddressKeys.district]
        state <- map[ShippingAddressKeys.state]
        country <- map[ShippingAddressKeys.country]
    }
}


