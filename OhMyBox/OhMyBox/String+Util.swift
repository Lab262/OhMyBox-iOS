//
//  String+Util.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 18/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
