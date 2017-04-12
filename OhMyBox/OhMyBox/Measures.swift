//
//  Measures.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 11/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

// Placeholder values

struct MeasureTypes {
    
    static let shirtMeasures: [String] = ["pp", "p", "m", "g", "gg"]
    static let pantsMeasuresRange = (30...48)
    static let shoesMeasuresRange = (30...48)
    
    static func pantsMeasure(value: Int) -> String? {
        
        if case pantsMeasuresRange = value {
            
            return String(value)
        } else {
            
            return nil
        }
    }
    
    static func shoesMeasure(value: Int) -> String? {
        
        if case shoesMeasuresRange = value {
            
            return String(value)
        } else {
            
            return nil
        }
    }
    
    static var shirtKey = "shirt"
    static var pantsKey = "pants"
    static var shoesKey = "shoes"
    
    static var descriptions = [shirtKey: "Blusa",
                        pantsKey: "Calça",
                        shoesKey: "Sapato"]
}


class Measures: PFObject {
    
    @NSManaged var ownerId: String?
    @NSManaged var values: [String: String]?
    
}

extension Measures {
    
    public typealias ViewData = [(title: String, value: String)]
    
    var viewData: ViewData {
        
        var data: ViewData = []
        if let values = values {
            
            for key in values.keys {
                
                let value = values[key]!
                data.append((MeasureTypes.descriptions[key]!, value))
            }
        }
        
        return data
    }
}

extension Measures: PFSubclassing {
    /**
     The name of the class as seen in the REST API.
     */
    public static func parseClassName() -> String {
        return "Measures"
    }

}
