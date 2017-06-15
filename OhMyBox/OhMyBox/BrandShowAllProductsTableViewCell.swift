//
//  BrandShowAllProductsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandShowAllProductsTableViewCell: UITableViewCell {

    static var identifier: String {
        return "brandShowAllProductsTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 44.0 * UIView.widthScaleProportion
    }
    
    static var nibName: String {
        return "BrandShowAllProductsTableViewCell"
    }
    
    var productsCount: Int = 0 {
        didSet {
            setShowAllButtonTitle(productsCount)
        }
    }
    
    var showAllAction: UIButton.ButtonHandler?
    
    @IBOutlet weak var showAllButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShowAllButtonTitle(productsCount)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setShowAllButtonTitle(_ productsCount: Int) {
        if let showAllButton = showAllButton {
            showAllButton.setTitle("VER LISTA DE TODOS OS PRODUTOS (\(productsCount))", for: .normal)
        }
    }
    
    @IBAction func showAll(sender: UIButton) {
        showAllAction?(sender)
    }
    
}
