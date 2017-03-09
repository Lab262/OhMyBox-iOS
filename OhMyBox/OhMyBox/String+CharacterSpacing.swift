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
    
    func with(characterSpacing: Double, lineSpacing: CGFloat, alignment: NSTextAlignment = NSTextAlignment.left) -> NSAttributedString {
        
        let att = NSMutableAttributedString(string: self)
        
        let attributeRange = NSRange(location: 0, length: att.length - 1)
        
        att.addAttribute(NSKernAttributeName, value: characterSpacing, range: attributeRange)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        style.alignment = alignment
        
        att.addAttribute(NSParagraphStyleAttributeName, value: style, range: attributeRange)
        
        
        return att
    }
    
    static func stringFromPrice(price: Double) -> String {
        return String(format: "R$ %.2lf", price).replacingOccurrences(of: ".", with: ",")
    }
}
