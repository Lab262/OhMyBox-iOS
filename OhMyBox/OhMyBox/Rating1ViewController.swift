//
//  Rating1ViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 15/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class Rating1ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    let dismissButtonTitle = "PULAR"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.textColor = UIColor.darkPurple
        subtitleLabel.textColor = UIColor.darkPurple
        dismissButton.setAttributedTitle(dismissButtonTitle.with(characterSpacing: 2.01, color: UIColor.darkPurple), for: .normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButtonAction(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

}
