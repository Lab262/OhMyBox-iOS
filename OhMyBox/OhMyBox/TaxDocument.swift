//
//  TaxDocument.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import ObjectMapper

class TaxDocument: NSObject, Mappable {
    var type: String?
    var number: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        type <- map[TaxDocumentKeys.type]
        number <- map[TaxDocumentKeys.number]
    }
}
