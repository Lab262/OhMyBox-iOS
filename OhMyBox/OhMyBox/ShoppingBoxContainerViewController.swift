//
//  ShoppingBoxContainerViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingBoxContainerViewController: UIViewController {

    enum ShoppingControllers {
        case box
        case requests
        
        var presentedAlphas: (box: CGFloat, requests: CGFloat) {
            
            let alphas: (CGFloat, CGFloat)
            
            switch self {
            case .box: alphas = (1, 0)
            case .requests: alphas = (0, 1)
            }
            
            return alphas
        }
    }
    
    @IBOutlet weak var buttonSegmentedControl: ButtonSegmentedControl!
    
    @IBOutlet weak var shoppingBoxContainer: UIView!
    @IBOutlet weak var shoppingRequestsContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtonSegmentedControl()
        setPresentedController(.box)
        // Do any additional setup after loading the view.
    }
    
    func setUpButtonSegmentedControl() {
        if let segmentedControlFont = UIFont(name: "AXIS-ExtraBold", size: 17) {
            
            buttonSegmentedControl.leftButtonFont = segmentedControlFont
            buttonSegmentedControl.rightButtonFont = segmentedControlFont
        }
        
        buttonSegmentedControl.leftButtonHandler = { button in
            self.setPresentedController(.box)
        }
        
        buttonSegmentedControl.rightButtonHandler = { button in
            self.setPresentedController(.requests)
        }
    }
    
    func setPresentedController(_ controller: ShoppingControllers) {
        
        let alphas = controller.presentedAlphas
        
        shoppingBoxContainer.alpha = alphas.box
        shoppingRequestsContainer.alpha = alphas.requests
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
