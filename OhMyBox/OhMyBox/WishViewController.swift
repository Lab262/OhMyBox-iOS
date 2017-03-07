//
//  WishViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 19/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class WishViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibs()
        self.configureNavigationBar()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    func configureNavigationBar() {
        
        self.navigationBarView.leftBarButton.isHidden = true
        self.navigationBarView.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerNibs() {
        tableView.registerNibFrom(ShowProductTableViewCell.self)
        tableView.registerNibFrom(WishlistCountTableViewCell.self)
    }
    
    func generateFavoriteCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowProductTableViewCell.identifier, for: indexPath) as! ShowProductTableViewCell
        
        cell.productImage.image = #imageLiteral(resourceName: "defaultWomanImage.png")
        
        return cell
    }
    
    func generateWishlistCountCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WishlistCountTableViewCell.identifier, for: indexPath) as! WishlistCountTableViewCell
        cell.wishlistCount = ApplicationState.sharedInstance.favoriteProducts.count
        
        return cell
    }
 
}
extension WishViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0: cell = generateWishlistCountCell(tableView, cellForRowAt: indexPath)
        default: cell = generateFavoriteCell(tableView, cellForRowAt: indexPath)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ApplicationState.sharedInstance.favoriteProducts.count + 1
    }
    
}

extension WishViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let viewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Home", identifier: "detailProduct")
        
         self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.row {
        case 0: height = WishlistCountTableViewCell.cellHeight
        default: height = ShowProductTableViewCell.cellHeight
        }
        
        return height
    }
  
    
}

