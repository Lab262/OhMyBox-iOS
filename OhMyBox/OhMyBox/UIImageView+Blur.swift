//
//  File.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 06/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func blurWithStyle(_ style: UIBlurEffectStyle?) -> UIVisualEffectView {
        
        let blurEffectView: UIVisualEffectView
        
        if let style = style {
            let blurEffect = UIBlurEffect(style: style)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
        } else {
            blurEffectView = UIVisualEffectView()
        }
        
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: blurEffectView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: blurEffectView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: blurEffectView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: blurEffectView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        self.addSubview(blurEffectView)
        
        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
        
        return blurEffectView
    }
}
