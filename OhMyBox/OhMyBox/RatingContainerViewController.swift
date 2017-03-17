//
//  RatingContainerViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 15/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class RatingContainerViewController: UIViewController {

    enum RateControllers {
        
        case rating1
        case rating2
        case rating3
        
        var presentedLeadingOffset: CGFloat {
            
            let offset: CGFloat
            let screenWidth = UIScreen.main.bounds.width
            
            switch self {
            case .rating1: offset = 0
            case .rating2: offset = -screenWidth
            case .rating3: offset = (-screenWidth * 2)
            }
            
            return offset
        }
    }
    
    @IBOutlet weak var rating1LeadingConstraint: NSLayoutConstraint!
    @IBOutlet var ratingContainers: [UIView]!
    
    let rating2Info: Rating2ViewController.Info = (#imageLiteral(resourceName: "rating_logo"), "BOLADO URBAN")
    
    var rating: Int?
    
    weak var rating1ViewController: Rating1ViewController! {
        didSet {
            rating1ViewController.acceptButtonHandler = { button in
                self.setPresentedController(.rating2)
            }
        }
    }
    
    weak var rating2ViewController: Rating2ViewController! {
        didSet {
            rating2ViewController.info = rating2Info
            rating2ViewController.rateHandler = { rating in
                self.rating = rating
                self.setPresentedController(.rating3)
                
                if let rating = self.rating {
                    self.rating3ViewController.info = (self.rating2Info.brandImage, rating)
                }
            }
        }
    }
    
    weak var rating3ViewController: Rating3ViewController! {
        didSet {
            rating3ViewController.doneButtonHandler = { button in
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    var switchAnimator: UIViewPropertyAnimator!
    
    var switchAnimation: (() -> ())!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switchAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: nil)
        switchAnimation = {
            self.view.layoutIfNeeded()
        }
        
        getChildViewControllersReferences()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getChildViewControllersReferences() {
        for vc in childViewControllers {
            if vc is Rating1ViewController {
                rating1ViewController = vc as! Rating1ViewController
            } else if vc is Rating2ViewController {
                rating2ViewController = vc as! Rating2ViewController
            } else if vc is Rating3ViewController {
                rating3ViewController = vc as! Rating3ViewController
            }
        }
    }
    
    func setPresentedController(_ controller: RateControllers) {
        rating1LeadingConstraint.constant = controller.presentedLeadingOffset
        switchAnimator.addAnimations(switchAnimation)
        switchAnimator.startAnimation()
    }
}
