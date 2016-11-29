//
//  Colour.swift
//  OhMyBox
//
//  Created by Felipe perius on 25/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class Colour: NSObject {
    var colourid : String?
    var colourHex : String?
    var isSelected: Bool? = false
    /** Inicializa colour
     */
    override init() {
        
    }
    
    /** Inicializa colour com paremetros
     */
    init(colourid : String, colourHex : String) {
        self.colourid = colourid
        self.colourHex = colourHex
    }

}
