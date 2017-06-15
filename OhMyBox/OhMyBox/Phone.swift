//
//  Phone.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import ObjectMapper

class Phone: NSObject, Mappable {
    var countryCode: String?
    var areaCode: String?
    var number: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        countryCode <- map[PhoneKeys.countryCode]
        areaCode <- map[PhoneKeys.areaCode]
        number <- map[PhoneKeys.number]
    }
}
