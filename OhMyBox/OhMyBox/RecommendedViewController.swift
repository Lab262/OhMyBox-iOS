//
//  RecommendedViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 23/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class RecommendedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
      
        self.navigationController?.navigationBar.backItem?.title = ""
    }
    
    func registerNib() {
        
        self.tableView.register(UINib(nibName: "WishTableViewCell", bundle: nil), forCellReuseIdentifier: WishTableViewCell.identifier)
        
        
    }
    
    func generateProducteCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WishTableViewCell.identifier, for: indexPath) as! WishTableViewCell
        cell.selectionStyle = .none
       cell.productImage.image = UIImage(named:"jacketImage")
        return cell
    }
    
    func generateHeaderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderRecommendedTableViewCell.identifier, for: indexPath) as! HeaderRecommendedTableViewCell
        cell.selectionStyle = .none
      
        return cell
    }

}
extension RecommendedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
              return generateHeaderCell(tableView, cellForRowAt: indexPath)
    
        default:
            return generateProducteCell(tableView, cellForRowAt: indexPath)
        }
      
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    
}

extension RecommendedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 70
        default:
            return 497
        }
        
        
        
    }
    
    
}
