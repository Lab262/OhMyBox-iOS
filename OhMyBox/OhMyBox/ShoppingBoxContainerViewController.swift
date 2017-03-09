//
//  ShoppingBoxContainerViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingBoxContainerViewController: UIViewController {

    @IBOutlet weak var buttonSegmentedControl: ButtonSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let segmentedControlFont = UIFont(name: "AXIS-ExtraBold", size: 17) {
        
            buttonSegmentedControl.leftButtonFont = segmentedControlFont
            buttonSegmentedControl.rightButtonFont = segmentedControlFont
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
