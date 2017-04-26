//
//  Array+Util.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

extension Array {

    func object(at index: Int) -> Element? {
        
        if index >= count || index < 0 {
            
            return nil
        } else {
            
            return self[index]
        }
    }
}
