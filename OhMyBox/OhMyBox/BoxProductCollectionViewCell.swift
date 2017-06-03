//
//  BoxProductCollectionViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 25/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class BoxProductCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return "boxProductCollectionViewCell"
    }
    
    static var cellSize: CGSize {
        return CGSize(width: 173, height: 203) * UIView.widthScaleProportion
    }
    
    static var nibName: String {
        return "BoxProductCollectionViewCell"
    }
    
    typealias Info = (imageFile: PFFile, name: String)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var info: Info? {
        
        didSet {
            
            updateInfo()
        }
    }
    
    var checkButtonHandler: UIButton.ButtonHandler?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    func updateInfo() {
        
        if let file = info?.imageFile {
            imageView.loadPFFile(file)
        }
        nameLabel.text = info?.name.capitalized
    }
    
    func setChecked(_ checked: Bool) {
        
        if checked {
            
            checkButton.setImage(#imageLiteral(resourceName: "box_product_button_checked"), for: .normal)
        } else {
            
            checkButton.setImage(#imageLiteral(resourceName: "box_product_button_unchecked"), for: .normal)
        }
    }
    
    override func prepareForReuse() {
        
        setChecked(false)
    }
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        
        checkButtonHandler?(sender)
    }
    
}
