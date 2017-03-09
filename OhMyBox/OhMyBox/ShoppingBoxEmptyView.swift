//
//  ShoppingBoxEmptyView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingBoxEmptyView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var view: UIView!
    
    var title: String? {
        didSet {
            titleLabel.attributedText = title?.with(characterSpacing: 1.08)
        }
    }
    
    var text: String? {
        didSet {
            textLabel.attributedText = text?.with(characterSpacing: 1.11)
        }
    }
    
    var buttonHandler: UIButton.ButtonHandler?
    
    override func awakeFromNib() {
        _ = Bundle.main.loadNibNamed("ShoppingBoxEmptyView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        buttonHandler?(sender)
    }
    
}
