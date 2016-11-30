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
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
 //   @IBOutlet weak var leftButtonIconImage: UIImageView!
    @IBOutlet weak var leftBarButton: UIButton!
   
    @IBAction func leftAction(_ sender: Any) {
        if let navController = UIApplication.topViewController()?.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func actionGoCart(_ sender: Any) {
        UIApplication.topViewController()?.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("ShoppingBox")!, animated: true, completion: nil)
        
       //  self.performSegue(withIdentifier:"goCart", sender:nil)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibInit()
    }
    
    func nibInit() {
        Bundle.main.loadNibNamed("IconNavigationBar", owner: self, options: nil)?[0]
        self.addSubview(view)
        view.frame = self.bounds
    }
//    
//    @IBInspectable var leftButtonIcon: UIImage? {
//        set {
//            self.leftButtonIconImage.image = newValue
//        }
//        get {
//            return self.leftButtonIconImage.image
//        }
//    }
    
//    @IBInspectable var titleIconImage: UIImage? {
//        set {
//            self.titleIconImage.image = newValue
//        }
//        get {
//            return self.titleIcon.image
//        }
//    }
//    
//    @IBInspectable var rightBarIconImage: UIImage? {
//        set {
//            self.rightIcon.image = newValue
//        }
//        get {
//            return self.rightIcon.image
//        }
//    }
//
//    
    @IBInspectable var titleLabelText: String? {
        set {
            self.titleLabel.text = newValue
        }
        get {
            return self.titleLabel.text
        }
    }
    
}


