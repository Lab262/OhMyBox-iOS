//
//  ShoppingBoxEmptyView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingBoxEmptyView: UIView {
    
    typealias Info = (image: UIImage, title: String, text: String, buttonHandler: UIButton.ButtonHandler?)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var view: UIView!
    
    var info: Info? {
        didSet {
            updateInfo()
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
    
    func updateInfo() {
        
        let titleAtt = info?.title.with(characterSpacing: 1.08, lineSpacing: -15, alignment: NSTextAlignment.center)
        
        
        
        titleLabel.attributedText = titleAtt
        textLabel.attributedText = info?.text.with(characterSpacing: 1.11, lineSpacing: -15, alignment: NSTextAlignment.center)
        imageView.image = info?.image
        buttonHandler = info?.buttonHandler
    }
    
}
