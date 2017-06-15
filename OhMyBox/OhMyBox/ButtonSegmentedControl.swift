//
//  ButtonSegmentedControl.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ButtonSegmentedControl: UIView {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var view: UIView!
    
    var leftButtonHandler: UIButton.ButtonHandler?
    var rightButtonHandler: UIButton.ButtonHandler?
    
    var leftButtonFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize) {
        didSet {
            leftButton?.titleLabel?.font = leftButtonFont
        }
    }
    var rightButtonFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize) {
        didSet {
            rightButton?.titleLabel?.font = rightButtonFont
        }
    }
    
    @IBInspectable var leftButtonCornerRadius: CGFloat = 2.0 {
        didSet {
            leftButton?.cornerRadius = leftButtonCornerRadius
        }
    }
    @IBInspectable var rightButtonCornerRadius: CGFloat = 2.0 {
        didSet {
            rightButton?.cornerRadius = rightButtonCornerRadius
        }
    }
    
    @IBInspectable var buttonSpacing: CGFloat = 5 {
        didSet {
            stackView?.spacing = buttonSpacing
        }
    }
    
    @IBInspectable var leftButtonHighlightedTitle: String = ""
    @IBInspectable var rightButtonHighlightedTitle: String = ""
    
    @IBInspectable var leftButtonNormalTitle: String = ""
    @IBInspectable var rightButtonNormalTitle: String = ""
    
    @IBInspectable var buttonHighlightedTitleColor: UIColor = .white
    @IBInspectable var buttonHighlightedBackgroundColor: UIColor = .colorWithHexString("241932")
    @IBInspectable var buttonHighlightedBorderColor: UIColor = .clear
    @IBInspectable var buttonHighlightedBorderWidth: CGFloat = 0.0
    
    @IBInspectable var buttonNormalTitleColor: UIColor = .colorWithHexString("919191")
    @IBInspectable var buttonNormalBackgroundColor: UIColor = .white
    @IBInspectable var buttonNormalBorderColor: UIColor = .colorWithHexString("919191")
    @IBInspectable var buttonNormalBorderWidth: CGFloat = 1.625
    
    var leftButtonHighlighted = false
    
    override func awakeFromNib() {
        _ = Bundle.main.loadNibNamed("ButtonSegmentedControl", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        
        leftButtonAction(sender: leftButton)
        updateFonts()
        updateLayout()
    }
    
    func updateFonts() {
        
        leftButton?.titleLabel?.font = leftButtonFont
        rightButton?.titleLabel?.font = rightButtonFont
    }
    
    func updateLayout() {
        leftButton?.cornerRadius = leftButtonCornerRadius
        rightButton?.cornerRadius = rightButtonCornerRadius
        
        stackView?.spacing = buttonSpacing
        
        leftButton?.titleLabel?.font = leftButtonFont
        rightButton?.cornerRadius = rightButtonCornerRadius
    }
    
    func setButtonHighlighted(_ button: UIButton) {
        button.setTitleColor(buttonHighlightedTitleColor, for: .normal)
        button.backgroundColor = buttonHighlightedBackgroundColor
        button.borderColor = buttonHighlightedBorderColor
        button.borderWidth = buttonHighlightedBorderWidth
        
        bringSubview(toFront: button)
    }
    
    func setButtonUnhighlighted(_ button: UIButton) {
        button.setTitleColor(buttonNormalTitleColor, for: .normal)
        button.backgroundColor = buttonNormalBackgroundColor
        button.borderColor = buttonNormalBorderColor
        button.borderWidth = buttonNormalBorderWidth
    }
    
    func setLeftButtonHighlighted() {
        setButtonHighlighted(leftButton)
        leftButton.setTitle(leftButtonHighlightedTitle, for: .normal)

        setButtonUnhighlighted(rightButton)
        rightButton.setTitle(rightButtonNormalTitle, for: .normal)
        
        leftButtonHighlighted = true
    }
    
    func setRightButtonHighlighted() {
        setButtonHighlighted(rightButton)
        rightButton.setTitle(rightButtonHighlightedTitle, for: .normal)
        
        setButtonUnhighlighted(leftButton)
        leftButton.setTitle(leftButtonNormalTitle, for: .normal)
        
        leftButtonHighlighted = false
    }

    @IBAction func leftButtonAction(sender: UIButton) {
        setLeftButtonHighlighted()
        leftButtonHandler?(sender)
    }
    
    @IBAction func rightButtonAction(sender: UIButton) {
        setRightButtonHighlighted()
        rightButtonHandler?(sender)
    }
    
}

