//
//  UIview+Util.swift
//  SupervisorApp
//
//  Created by Andre Santana Ferreira on 07/09/16.
//  Copyright © 2016 Andre Santana Ferreira. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK: Arredondar bordas de uma view
    
    func roundCorner(value : CGFloat){
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
    
    //MARK: Arredondar bordas de uma view até virar circulo
    func roundToCircle(){
        self.layer.cornerRadius = self.bounds.width/2
        self.layer.masksToBounds = true
    }
    
    //MARK: Transforma uma view em um losango
    func transformToRhombus() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.bounds.size.width / 2.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height / 2.0))
        path.addLine(to: CGPoint(x: self.bounds.size.width / 2.0, y: self.bounds.size.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.size.height / 2.0))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor
        self.layer.mask = shapeLayer
    }
    
    //MARK: Transforma uma view em um triangulo
    func transformToTriangle() {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: self.bounds.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0.0, y: self.bounds.height))
        path.addLine(to: CGPoint(x: self.bounds.width/2, y: 0.0))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor
        self.layer.mask = shapeLayer
    }
    
    //MARK: Adicionar paralax a uma view
    func addParallaxToView(amount : CGFloat) {
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        self.addMotionEffect(group)
    }
    
    static var loadingFeedbackViewTag: Int {
        
        return 0x192F3
    }
    
    func addLoadingFeedback(indicatorStyle: UIActivityIndicatorViewStyle = .gray) {
        
        let tag = UIView.loadingFeedbackViewTag
        
        guard viewWithTag(tag) == nil else { return }
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: indicatorStyle)
        indicator.tag = tag
        
        indicator.frame = frame
        
        addSubview(indicator)
        
        indicator.startAnimating()
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    func removeLoadingFeedback() {
        
        let tag = UIView.loadingFeedbackViewTag
        
        if let view = viewWithTag(tag) {
            
            view.removeFromSuperview()
        }
    }
    
}
