//
//  ShoppingBoxViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 31/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import BGTableViewRowActionWithImage

class ShoppingBoxViewController: UIViewController {
    
    @IBOutlet weak var buyShopBar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    var textSegmentLabel: UILabel?
    var isActiveBox = true
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    var productsMail: [String] = ["joia", "camisa"]
    var productsOrdersStorage: [String] = ["joia","calça","roupa"]
    @IBAction func buyAction(_ sender: AnyObject) {
        performSegue(withIdentifier:"segueFinalPurchase", sender:self)
    }
    
    @IBAction func changeListOrder(_ sender: AnyObject) {
        if (isActiveBox){
            self.orderButton.backgroundColor = UIColor.hexStringToUIColor(hex:"241932")
            self.boxButton.backgroundColor = UIColor.hexStringToUIColor(hex:"FFFFFF")
            self.boxButton.setTitleColor(UIColor.hexStringToUIColor(hex:"241932"), for:UIControlState.normal)
            self.orderButton.setTitleColor(UIColor.hexStringToUIColor(hex:"FFFFFF"), for:UIControlState.normal)
            self.isActiveBox = false
            self.boxButton.borderWidth = 1
            self.boxButton.borderColor = UIColor.black
            self.tableView.reloadData()
        }
    }
    @IBAction func changeBox(_ sender: AnyObject) {
        if (isActiveBox==false){
            self.boxButton.backgroundColor = UIColor.hexStringToUIColor(hex:"241932")
            self.orderButton.backgroundColor = UIColor.hexStringToUIColor(hex:"FFFFFF")
            self.boxButton.borderWidth = 1
            self.boxButton.borderColor = UIColor.black
            self.boxButton.setTitleColor(UIColor.hexStringToUIColor(hex:"FFFFFF"), for:UIControlState.normal)
            self.orderButton.setTitleColor(UIColor.hexStringToUIColor(hex:"241932"), for:UIControlState.normal)
            self.isActiveBox = true
            self.tableView.reloadData()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        
        
        
    }
    
    
    @IBAction func backToViewController(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func registerNib(){
        let nib = UINib(nibName: "ShoppingBoxTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: ShoppingBoxTableViewCell.identifier)
        
        self.tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: OrderTableViewCell.identifier)
        
        self.tableView.register(UINib(nibName: "StatusOrderTableViewCell", bundle: nil), forCellReuseIdentifier: StatusOrderTableViewCell.identifier)
        
    }
    
    func generateShoppingCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBoxTableViewCell.identifier, for: indexPath) as! ShoppingBoxTableViewCell
        return cell
    }
    
    func generateOrderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath) as! OrderTableViewCell
        cell.isEditing = false
        cell.lineSectionView.isHidden = true
        
        if ((self.productsMail.count+self.productsOrdersStorage.count)==indexPath.row){
            cell.lineSectionView.backgroundColor = UIColor.hexStringToUIColor(hex:"ffbdc3")
            cell.lineSectionView.isHidden = false
        }
        if (indexPath.row == 0){
            cell.lineSectionView.isHidden = false
            cell.lineSectionView.backgroundColor = UIColor.black
        }
        
        
        return cell
    }
    
    
    func generateStatusCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StatusOrderTableViewCell.identifier, for: indexPath) as! StatusOrderTableViewCell
        cell.isEditing = false
        if indexPath.row == self.productsOrdersStorage.count+self.productsMail.count+1 {
            cell.footContentView.backgroundColor = UIColor.hexStringToUIColor(hex:"ff8591")
            cell.headContentView.backgroundColor = UIColor.hexStringToUIColor(hex:"ffeeef")
            
        }
        
        return cell
        
        
    }
    
    
}


extension ShoppingBoxViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (self.isActiveBox) {
            //self.buyShopBar.isHidden = false
            
            return self.generateShoppingCell(tableView, cellForRowAt:indexPath)
        }else {
            //self.buyShopBar.isHidden = true
            if (indexPath.row == self.productsOrdersStorage.count){
                return self.generateStatusCell(tableView, cellForRowAt:indexPath)
            }
            
            if (indexPath.row == self.productsOrdersStorage.count+self.productsMail.count+1){
                return self.generateStatusCell(tableView, cellForRowAt:indexPath)
            }
            return self.generateOrderCell(tableView, cellForRowAt:indexPath)
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (!isActiveBox) {
            return (self.productsOrdersStorage.count+self.productsMail.count)+2
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (!isActiveBox) {
            return 1
        }
        return 3
    }
    
    
}

extension ShoppingBoxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (self.isActiveBox) {
            return ShoppingBoxTableViewCell.cellHeight
            
        }
        
        if (self.productsOrdersStorage.count>indexPath.row){
            let height = self.view.bounds.size.width * 0.348
            return height
            
        } else if self.productsOrdersStorage.count == indexPath.row {
            return 200
            
        } else if self.productsOrdersStorage.count+self.productsMail.count+1 > indexPath.row {
            let height = self.view.bounds.size.width * 0.348
            return height
        } else {
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if isActiveBox {
            return 25.0
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
