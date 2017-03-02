//
//  NSAttributedString+CharacterSpacing.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 15/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

extension String {
    
    func with(characterSpacing: Double) -> NSAttributedString {
        
        let att = NSMutableAttributedString(string: self)
        att.addAttribute(NSKernAttributeName, value: characterSpacing, range: NSRange(location: 0, length: att.length - 1))
        
        return att
    }
    
    static func stringFromPrice(price: Double) -> String {
        return String(format: "R$ %.2d", price).replacingOccurrences(of: ".", with: ",")
    }
}
