//
//  Measure.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 24/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

enum MeasureType{
    case pp
    case p
    case m
    case g
    case gg
}

class Measure: PFObject, PFSubclassing {
    
    var measureType: MeasureType?
    var amount: Int?
    
    override class func initialize() {
        self.registerSubclass()
    }
    
    static func parseClassName() -> String {
        return "Measure"
    }
}
