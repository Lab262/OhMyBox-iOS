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
    var productsMail: [String] = ["joia"]
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
        
        self.tableView.register(UINib(nibName: "ShoppingBoxTableViewCell", bundle: nil), forCellReuseIdentifier: ShoppingBoxTableViewCell.identifier)
        
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
        if (indexPath.row==5){
            cell.footContentView.backgroundColor = UIColor.hexStringToUIColor(hex:"ff8591")
             cell.headContentView.backgroundColor = UIColor.hexStringToUIColor(hex:"ffeeef")
            
        }
        
        return cell
    
    
    }


}


extension ShoppingBoxViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (self.isActiveBox==true){
            //self.buyShopBar.isHidden = false

            return self.generateShoppingCell(tableView, cellForRowAt:indexPath)
        }else {
            //self.buyShopBar.isHidden = true
            if (indexPath.row == 3){
                return self.generateStatusCell(tableView, cellForRowAt:indexPath)
            }
            
            if (indexPath.row == 5){
                return self.generateStatusCell(tableView, cellForRowAt:indexPath)
            }
            return self.generateOrderCell(tableView, cellForRowAt:indexPath)
            
        }
      
     
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (isActiveBox == false){
            return (self.productsOrdersStorage.count+self.productsMail.count)+2
        }
        
        return 3
    }
    
    
    
    
}

extension ShoppingBoxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (self.isActiveBox == true){
            return 150
        }else if (self.productsOrdersStorage.count+1==indexPath.row){
            return 200
        }else if (self.productsMail.count+1==indexPath.row){
            return 200
        }
        
        return 200
        
        
        
    }
    
       
}
