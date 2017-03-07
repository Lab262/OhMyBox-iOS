//
//  ButtonSegmentedControl.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ButtonSegmentedControl: UIView {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var view: UIView!
    
    var leftButtonHandler: UIButton.ButtonHandler?
    var rightButtonHandler: UIButton.ButtonHandler?
    
    @IBInspectable var leftButtonHighlightedTitle: String = ""
    @IBInspectable var rightButtonHighlightedTitle: String = ""
    
    @IBInspectable var leftButtonNormalTitle: String = ""
    @IBInspectable var rightButtonNormalTitle: String = ""
    
    var buttonHighlightedTitleColor = UIColor.white
    var buttonHighlightedBackgroundColor = UIColor.colorWithHexString("241932")
    var buttonHighlightedBorderColor = UIColor.clear
    var buttonHighlightedBorderWidth: CGFloat = 0.0
    
    var buttonNormalTitleColor = UIColor.colorWithHexString("919191")
    var buttonNormalBorderColor = UIColor.colorWithHexString("919191")
    var buttonNormalBackgroundColor = UIColor.white
    var buttonNormalBorderWidth: CGFloat = 1.625
    
    var leftButtonHighlighted = false
    
    override func awakeFromNib() {
        _ = Bundle.main.loadNibNamed("ButtonSegmentedControl", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        leftButtonAction(sender: leftButton)
    }
    
    func setButtonHighlighted(_ button: UIButton) {
        button.setTitleColor(buttonHighlightedTitleColor, for: .normal)
        button.backgroundColor = buttonHighlightedBackgroundColor
        button.borderColor = buttonHighlightedBorderColor
        button.borderWidth = buttonHighlightedBorderWidth
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

