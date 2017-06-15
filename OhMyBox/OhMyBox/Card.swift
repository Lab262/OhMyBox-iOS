//
//  Card.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import ObjectMapper

class Card: NSObject, Mappable {
    
    var number: String?
    var expirationMonth: String?
    var expirationYear: String?
    var cvc: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        number <- map[CreditCardKeys.number]
        expirationMonth <- map[CreditCardKeys.expirationMonth]
        expirationYear <- map[CreditCardKeys.expirationYear]
        cvc <- map[CreditCardKeys.cvc]
    }
}
