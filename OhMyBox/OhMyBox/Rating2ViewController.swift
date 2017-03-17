//
//  Rating2ViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 17/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class Rating2ViewController: UIViewController {

    typealias Info = (brandImage: UIImage, brandName: String)
    
    static let rateString = "AVALIE"
    static let ratingMattersString = "SUA OPINIÃO É IMPORTANTE"
    
    static let rateStringSpacing = 1.6
    static let ratingMattersStringSpacing = 2.6
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var ratingMattersLabel: UILabel!
    
    var rateHandler: ((Int) -> ())?
    
    var info: Info? {
        didSet {
            updateInfo()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateInfo() {
        
        imageView.image = info?.brandImage
        
        rateLabel.attributedText = Rating2ViewController.rateString.with(characterSpacing: Rating2ViewController.rateStringSpacing)
        brandNameLabel.attributedText = info?.brandName.with(characterSpacing: Rating2ViewController.rateStringSpacing)
        
        ratingMattersLabel.attributedText = Rating2ViewController.ratingMattersString.with(characterSpacing: Rating2ViewController.ratingMattersStringSpacing)
    }
    
    @IBAction func star1Action(_ sender: UIButton) {
        rate(1)
    }
    
    @IBAction func star2Action(_ sender: UIButton) {
        rate(2)
    }
    
    @IBAction func star3Action(_ sender: UIButton) {
        rate(3)
    }
    
    @IBAction func star4Action(_ sender: UIButton) {
        rate(4)
    }
    
    @IBAction func star5Action(_ sender: UIButton) {
        rate(5)
    }

    func rate(_ rating: Int) {
        rateHandler?(rating)
    }
    
}
