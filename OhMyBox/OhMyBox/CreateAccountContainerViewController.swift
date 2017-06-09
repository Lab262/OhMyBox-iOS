//
//  CreateAccountContainerViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 07/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CreateAccountContainerViewController: UIViewController {
    
    @IBOutlet weak var stepOneLeadingConstraint: NSLayoutConstraint!
    
    enum CreateAccountControllers {
        
        case stepOne
        case stepTwo
        case stepThree
        
        var presentedLeadingOffset: CGFloat {
            
            let offset: CGFloat
            let screenWidth = UIScreen.main.bounds.width
            
            switch self {
            case .stepOne: offset = 0
            case .stepTwo: offset = -screenWidth
            case .stepThree: offset = (-screenWidth * 2)
            }
            
            return offset
        }
    }
    
    weak var step1ViewController: CreateAccountFirstStepViewController! {
        didSet {
            step1ViewController.nextButtonHandler = { button in
                self.setPresentedController(.stepTwo)
            }
        }
    }
    
    weak var step2ViewController: CreateAccountSecondStepViewController! {
        didSet {
            step2ViewController.nextButtonHandler = { button in
                self.setPresentedController(.stepThree)
            }
        }
    }
    
//    weak var rating3ViewController: Rating3ViewController! {
//        didSet {
//            rating3ViewController.doneButtonHandler = { button in
//                
//                let feedbackOptions = self.rating3ViewController.selectedButtonIndexes.map {
//                    
//                    PurchaseRequestFeedbackManager.shared.feedbackOptions[$0]
//                }
//                self.presenter.setFeedbackOptions(feedbackOptions)
//                self.presenter.sendRating()
//            }
//        }
    //}
    
    var switchAnimator: UIViewPropertyAnimator!
    var switchAnimation: (() -> ())!

    override func viewDidLoad() {
        super.viewDidLoad()
        switchAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: nil)
        switchAnimation = {
            self.view.layoutIfNeeded()
        }
        getChildViewControllersReferences()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.setPresentedController(.stepOne)
    }
    
    func getChildViewControllersReferences() {
        for vc in childViewControllers {
            if vc is CreateAccountFirstStepViewController {
                step1ViewController = vc as! CreateAccountFirstStepViewController
            } else if vc is CreateAccountSecondStepViewController {
                step2ViewController = vc as! CreateAccountSecondStepViewController
            }
//            else if vc is CreateAccountThirdStepViewController {
//                step3ViewController = vc as! CreateAccountThirdStepViewController
//            }
        }
    }
    
    func setPresentedController(_ controller: CreateAccountControllers) {
        stepOneLeadingConstraint.constant = controller.presentedLeadingOffset
        switchAnimator.addAnimations(switchAnimation)
        switchAnimator.startAnimation()
    }
}
