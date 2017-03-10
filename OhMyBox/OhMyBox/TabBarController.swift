//
//  ViewController.swift
//  OhMyBox
//
//  Created by Thiago-Bernardes on 10/7/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(TabBarController.selectHomeViewController(_:)), name: Notifications.selectHomeViewController, object: nil)
    }
    
    func selectViewController(at index: Int) {
        selectedIndex = index
    }
    
    func selectHomeViewController(_ notification: Notification) {
        selectViewController(at: 0)
    }

}
