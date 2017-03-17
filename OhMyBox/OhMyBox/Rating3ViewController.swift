//
//  Rating3ViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 17/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class Rating3ViewController: UIViewController {

    typealias Info = (image: UIImage, rating: Int)
    
    static let thankYouString = "MUITO OBRIGADO!"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var thankYouLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet var starImageViews: [UIImageView]!
    @IBOutlet var feedbackButtons: [UIButton]!
    
    @IBOutlet var doneButton: UIButton!
    
    var info: Info? {
        didSet {
            updateInfo()
        }
    }
    var doneButtonHandler: UIButton.ButtonHandler?
    
    fileprivate var ratingString: String? {
        
        let str: String?
        if let rating = info?.rating {
            str = "AVALIADO EM \(rating) ESTRELA" + (rating == 1 ? "" : "S")
        } else {
            str = nil
        }
        return str
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in feedbackButtons {
            button.layer.cornerRadius = 4.0
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateInfo() {
        
        thankYouLabel.attributedText = Rating3ViewController.thankYouString.with(characterSpacing: 1.6)
        ratingLabel.attributedText = ratingString?.with(characterSpacing: 2.6)
        
        if let rating = info?.rating {
            for i in 0..<starImageViews.count {
                
                let star = starImageViews[i]
                
                star.isHidden = i >= rating
            }
        }
    }
    
    @IBAction func donoButtonAction(_ sender: UIButton) {
        doneButtonHandler?(sender)
    }
}
