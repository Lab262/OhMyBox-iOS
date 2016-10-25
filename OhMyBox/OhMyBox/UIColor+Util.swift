//
//  UIColor+Util.swift
//  SupervisorApp
//
//  Created by Andre Santana Ferreira on 07/09/16.
//  Copyright © 2016 Andre Santana Ferreira. All rights reserved.
//

import UIKit

extension UIColor {
 
    class func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString : String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue : UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
