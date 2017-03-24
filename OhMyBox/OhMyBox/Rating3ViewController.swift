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
    
    struct OutletStrings {
        
        static let thankYouString = "MUITO OBRIGADO!"
        static let doneButtonTitle = "PRONTO, TERMINEI"
        static let goodFeedbackString = "DO QUE VOCÊ MAIS GOSTOU?"
        static let badFeedbackString = "O QUE ACONTECEU?"
        
        static let goodFeedbackOptions = ["Responde rápido", "Amei o produto", "Chegou no prazo", "Muito atenciosos"]
        static let badFeedbackOptions = ["Demorou muito", "Veio estragado", "Não responderam", "Pedido errado"]
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var thankYouLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet var starImageViews: [UIImageView]!
    @IBOutlet var feedbackButtons: [UIButton]!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var feedbackAskLabel: UILabel!
    
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
        doneButton.setAttributedTitle(OutletStrings.doneButtonTitle.with(characterSpacing: 1.59, color: .white), for: .normal)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateInfo() {
        
        thankYouLabel.attributedText = OutletStrings.thankYouString.with(characterSpacing: 1.6)
        ratingLabel.attributedText = ratingString?.with(characterSpacing: 2.6)
        
        if let rating = info?.rating {
            updateStars(rating: rating)
            updateFeedbackAskLabel(rating: rating)
            updateFeedbackButtons(rating: rating)
        }
        
    }
    
    func updateStars(rating: Int) {
        for i in 0..<starImageViews.count {
            
            let star = starImageViews[i]
            
            star.isHidden = i >= rating
        }
    }
    
    func updateFeedbackAskLabel(rating: Int) {
        
        let attributedText: NSAttributedString
        
        if rating >= 3 {
            attributedText = OutletStrings.goodFeedbackString.with(characterSpacing: 2.78)
        } else {
            attributedText = OutletStrings.badFeedbackString.with(characterSpacing: 2.78)
        }
        
        feedbackAskLabel.attributedText = attributedText
    }
    
    func updateFeedbackButtons(rating: Int) {
        
        let feedbackOptions = rating >= 3 ? OutletStrings.goodFeedbackOptions : OutletStrings.badFeedbackOptions
        
        for enumeration in feedbackButtons.enumerated() {
            
            let button = enumeration.element
            button.setTitle(feedbackOptions[enumeration.offset], for: .normal)
        }
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        doneButtonHandler?(sender)
    }
    
    @IBAction func feedbackButtonAction(_ sender: UIButton) {
        
//        let index = feedbackButtons.index(of: sender)
    }
}
