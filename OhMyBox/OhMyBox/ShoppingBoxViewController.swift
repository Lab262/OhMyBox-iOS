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

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var textSegmentLabel: UILabel?
    
    @IBAction func buyAction(_ sender: AnyObject) {
        performSegue(withIdentifier:"segueFinalPurchase", sender:self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        segmentControl.layer.cornerRadius = 0.0
        segmentControl.layer.borderWidth = 1
        
        
       
    }

    @IBAction func backToViewController(_ sender: AnyObject) {
    
        self.dismiss(animated: true, completion: nil)
       
    }

    @IBAction func selectUnitOrBox(_ sender: AnyObject) {
    
        self.tableView.reloadData()
        
    }
    
    func registerNib(){
        
        self.tableView.register(UINib(nibName: "ShoppingBoxTableViewCell", bundle: nil), forCellReuseIdentifier: ShoppingBoxTableViewCell.identifier)
        
        self.tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: OrderTableViewCell.identifier)
    }
    
    func generateShoppingCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBoxTableViewCell.identifier, for: indexPath) as! ShoppingBoxTableViewCell
               return cell
    }
    
    func generateOrderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath) as! OrderTableViewCell
         cell.isEditing = false
        return cell
    }

}


extension ShoppingBoxViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (self.segmentControl.selectedSegmentIndex == 0){
            
            return self.generateShoppingCell(tableView, cellForRowAt:indexPath)
        }else {
            
            return self.generateOrderCell(tableView, cellForRowAt:indexPath)
        }
      
     
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    
    
    
}

extension ShoppingBoxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
            return 150
       
    }
    
       
}
