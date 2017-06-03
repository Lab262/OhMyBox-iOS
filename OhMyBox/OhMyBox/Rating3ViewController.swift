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
    }
    
    struct ButtonColors {
        
        static let backgroundSelected = UIColor.darkPurple
        static let backgroundUnselected = UIColor.white
        
        static let textSelected = UIColor.white
        static let textUnselected = UIColor.darkPurple
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
    
    var selectedButtonIndexes: [Int] = [] {
        
        didSet {
            
            selectedButtonIndexes.sort()
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
        
        let opr = PurchaseRequestFeedbackManager.shared.feedbackOptionsPerRating
        
        let feedbackOptions = rating >= 3 ? opr[3]! : opr[2]!
        
        for enumeration in feedbackButtons.enumerated() {
            
            let button = enumeration.element
            button.setTitle(feedbackOptions[enumeration.offset], for: .normal)
        }
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        doneButtonHandler?(sender)
    }
    
    @IBAction func feedbackButtonAction(_ sender: UIButton) {
        
        let index = feedbackButtons.index(of: sender)!
        
        if selectedButtonIndexes.contains(index) {
            
            _ = selectedButtonIndexes.remove(index)
            changeButton(sender, toSelected: false)
        } else {
            
            selectedButtonIndexes.append(index)
            changeButton(sender, toSelected: true)
        }
    }
    
    // TODO: generalize the dual-state button
    func changeButton(_ button: UIButton, toSelected selected: Bool) {
        
        let textColor: UIColor
        let backgroundColor: UIColor
        
        if selected {
            
            textColor = ButtonColors.textSelected
            backgroundColor = ButtonColors.backgroundSelected
        } else {
            
            textColor = ButtonColors.textUnselected
            backgroundColor = ButtonColors.backgroundUnselected
        }
        
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = backgroundColor
    }
}
