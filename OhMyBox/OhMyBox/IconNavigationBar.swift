//
//  IconNavigationBar.swift
//  OhMyBox
//
//  Created by Thiago-Bernardes on 08/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit


class IconNavigationBar: UIView {

    @IBOutlet var view: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var rightHitboxButton: UIButton!
    
    @IBOutlet weak var leftBarButton: UIButton!
    @IBOutlet weak var leftHitboxButton: UIButton!
   
    var showsLeftBarButton: Bool = true {
        didSet {
            updateLeftButtonsHidden()
        }
    }
    
    var showsRightBarButton: Bool = true {
        didSet {
            updateRightButtonsHidden()
        }
    }
    
    @IBAction func leftAction(_ sender: Any) {
        if let navController = UIApplication.topViewController()?.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func actionGoCart(_ sender: Any) {
        goToCart(startsInBox: true, nil)
    }
    
    func goToCart(startsInBox: Bool, _ completion: (() -> ())?) {
        let navController = ViewUtil.viewControllerFromStoryboardWithIdentifier("ShoppingBox") as! UINavigationController
        let vc = navController.topViewController as! ShoppingBoxContainerViewController
        vc.startsInBox = startsInBox
        UIApplication.topViewController()?.present(navController, animated: true, completion: completion)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Bundle.main.loadNibNamed("IconNavigationBar", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    func updateButtonsHidden() {
        
        updateLeftButtonsHidden()
        updateRightButtonsHidden()
    }
    
    func updateLeftButtonsHidden() {
     
        leftBarButton.isHidden = !showsLeftBarButton
        leftHitboxButton.isHidden = !showsLeftBarButton
    }
    
    func updateRightButtonsHidden() {
        
        boxButton.isHidden = !showsRightBarButton
        rightHitboxButton.isHidden = !showsRightBarButton
    }
    
    @IBInspectable var titleLabelText: String? {
        set {
            self.titleLabel.text = newValue
        }
        get {
            return self.titleLabel.text
        }
    }
    
}


