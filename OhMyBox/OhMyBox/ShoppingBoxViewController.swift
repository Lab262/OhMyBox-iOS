//
//  ShoppingBoxViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 31/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShoppingBoxViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        segmentControl.layer.cornerRadius = 0.0
        segmentControl.layer.borderWidth = 1.5
       
    }

    @IBAction func backToViewController(_ sender: AnyObject) {
    
        self.dismiss(animated: true, completion: nil)
       
    }

    
    func registerNib(){
        
    self.tableView.register(UINib(nibName: "ShoppingBoxTableViewCell", bundle: nil), forCellReuseIdentifier: ShoppingBoxTableViewCell.identifier)
        
    }
    func generateShoppingCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBoxTableViewCell.identifier, for: indexPath) as! ShoppingBoxTableViewCell
               return cell
    }
}


extension ShoppingBoxViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                return self.generateShoppingCell(tableView, cellForRowAt:indexPath)
            case 1:
                return UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    
    
}

extension ShoppingBoxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
            return 300
       
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
      
        
            return  UITableViewCellEditingStyle.insert
        
        
    }
    
}
