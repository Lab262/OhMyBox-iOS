//
//  DetailProductViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 24/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    var product = Product()
    var buttonIndexPath = IndexPath.init(row: 3, section: 0)
    var isSelect = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibs()
        
        self.initializeStatesButtons()
        self.setupNavigationAppearance()
        self.setConfigurationBar()
    }
    
    func setConfigurationBar() {
        self.navigationBarView.titleLabel.text = ""
        self.navigationBarView.view.backgroundColor = .clear
    }
    
    func initializeStatesButtons() {
        
        self.likeButton.setImage(#imageLiteral(resourceName: "heartEmpty_button"), for: .normal)
        self.likeButton.setImage(#imageLiteral(resourceName: "heartFull_button"), for: .selected)
        
        self.boxButton.setImage(#imageLiteral(resourceName: "box_button"), for: .normal)
        self.boxButton.setImage(#imageLiteral(resourceName: "boxSelected_button"), for: .selected)
    }
    
    
    @IBAction func addToCart(_ sender: Any) {
        self.changeBoxButtonState()
    }
    
    @IBAction func setFavorite(_ sender: Any) {
        self.changeFavoriteButtonState()
        
    }
    
    func changeFavoriteButtonState() {
        if self.likeButton.isSelected {
            self.likeButton.isSelected = false
            
            self.likeButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.likeButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
            
            
        } else {
            self.likeButton.isSelected = true
            
            self.likeButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.likeButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
        }
    }
    
    func changeBoxButtonState() {
        
        if self.boxButton.isSelected {
            self.boxButton.isSelected = false
            
            self.boxButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.boxButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
            
            
        } else {
            self.boxButton.isSelected = true
            
            self.boxButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.boxButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
        }
        
    }
    
    
    func registerNibs() {
        
        tableView.registerNibFrom(ProductImageTableViewCell.self)
        tableView.registerNibFrom(ProductLabelTableViewCell.self)
        tableView.registerNibFrom(ProductOptionsTableViewCell.self)
        
    }
    
    func generateProductHeaderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductImageTableViewCell.identifier) as! ProductImageTableViewCell
        return cell
    }
    
    func generateProductLabelCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductLabelTableViewCell.identifier) as! ProductLabelTableViewCell
        
        cell.name = "Capa tropical"
        cell.price = 40.0
        
        return cell
    }
    
    func generateProductOptionsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductOptionsTableViewCell.identifier) as! ProductOptionsTableViewCell
        
        cell.colors = [.black, .red, .cyan, .purple]
        cell.sizes = ["PP", "M", "G", "GG"]
        
        return cell
    }
    
    
    func selectDescriptionButton (_ sender: UIButton) {
        let cell = tableView.dequeueReusableCell(withIdentifier: SwitchProductButtonTableViewCell.identifier, for:buttonIndexPath) as! SwitchProductButtonTableViewCell
        
        
        
        
        
        cell.detailButton.setBackgroundImage(#imageLiteral(resourceName: "profile_about_button"), for: UIControlState.normal)
        cell.descriptionButton.setBackgroundImage(#imageLiteral(resourceName: "profile_mydata_button"), for: UIControlState.normal)
        
        cell.descriptionButton.setTitleColor(UIColor.white, for:UIControlState.normal)
        cell.detailButton.setTitleColor(UIColor.hexStringToUIColor(hex:"b8b8b8"), for:UIControlState.normal)
        
        
        self.isSelect = false
        self.tableView.reloadData()
    }
    
    
    func selectDetailButton (_ sender: UIButton) {
        let cell = tableView.dequeueReusableCell(withIdentifier: SwitchProductButtonTableViewCell.identifier, for:buttonIndexPath) as! SwitchProductButtonTableViewCell
        
        cell.descriptionButton.setBackgroundImage(#imageLiteral(resourceName: "profile_about_button"), for: UIControlState.normal)
        
        cell.detailButton.setBackgroundImage(#imageLiteral(resourceName: "profile_mydata_button"), for: UIControlState.normal)
        
        cell.detailButton.setTitleColor(UIColor.white, for:UIControlState.normal)
        cell.descriptionButton.setTitleColor(UIColor.hexStringToUIColor(hex:"b8b8b8"), for:UIControlState.normal)
        
        self.isSelect = true
        
        self.tableView.reloadData()
    }
    
    func setupNavigationAppearance(){
        
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
}

extension DetailProductViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0: cell = generateProductHeaderCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateProductLabelCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generateProductOptionsCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

extension DetailProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return ProductImageTableViewCell.cellHeight
        case 1:
            return ProductLabelTableViewCell.cellHeight
        case 2:
            return ProductOptionsTableViewCell.cellHeight
        case 3:
            return 100
        case 4:
            return 300
        case 5 :
            return 88
        case 6:
            return 100
            
        default:
            return 497
        }
    }
    
}
