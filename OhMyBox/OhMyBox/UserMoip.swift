//
//  UserMoip.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import ObjectMapper

class UserMoip: NSObject, Mappable {
    
    var id: String?
    var ownId: String?
    var fullName: String?
    var birthdate: String?
    var email: String?
    var phone: Phone?
    var taxDocument: TaxDocument?
    var shippingAddress: ShippingAddress?
    
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        id <- map[UserMoipKeys.id]
        ownId <- map[UserMoipKeys.ownId]
        fullName <- map[UserMoipKeys.fullName]
        email <- map[UserMoipKeys.email]
        phone <- map[UserMoipKeys.phone]
        taxDocument <- map[UserMoipKeys.taxDocument]
        shippingAddress <- map[UserMoipKeys.shippingAddress]
    }
}
