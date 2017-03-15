//
//  RatingContainerViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 15/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class RatingContainerViewController: UIViewController {

    @IBOutlet weak var rating1Container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getChildViewControllersReferences() {
        let vcs = childViewControllers
        for vc in vcs {
            
            if vc is SearchViewController {
                
            }
        }
    }
}
