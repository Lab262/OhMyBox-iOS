//
//  PrintView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PrintView: UIView {
    
    @IBInspectable var color: UIColor = .clear {
        didSet {
            setNeedsDisplay() 
        }
    }
    
    var emptyPrintStrokePath = UIBezierPath()
    var fillPath = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        
        if color == .clear {
            
            emptyPrintStrokePath.removeAllPoints()
            
            emptyPrintStrokePath.move(to: rect.origin)
            emptyPrintStrokePath.addLine(to: CGPoint(x: 0, y: rect.size.height))
            emptyPrintStrokePath.addLine(to: CGPoint(x: rect.size.width, y: 0))
            
            UIColor.emptyPrintStroke.setStroke()
            emptyPrintStrokePath.stroke()
            
            backgroundColor = .white
        } else {
            
            fillPath.removeAllPoints()
            
            fillPath = UIBezierPath(rect: rect)
            
            color.setStroke()
            color.setFill()
            
            path.fill()
            path.stroke()
        }
    }
}
