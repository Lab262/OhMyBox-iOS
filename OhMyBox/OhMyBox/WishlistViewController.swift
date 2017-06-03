//
//  WishlistViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 19/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    
    var presenter = WishlistPresenter()
    
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
        
        self.navigationBarView.showsLeftBarButton = false
        self.navigationBarView.layoutIfNeeded()
    }
    
    func registerNibs() {
        tableView.registerNibFrom(BoxTableViewCell.self)
        tableView.registerNibFrom(WishlistCountTableViewCell.self)
    }
    
    func generateBoxCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxTableViewCell.identifier, for: indexPath) as! BoxTableViewCell
        
        let box = presenter.favoriteBoxes[indexPath.row - 1]
        
        cell.info = (box.name, box.boxDescription, box.price.doubleValue, box.brand.photo, box.products.map { $0.photos.object(at: 0) })
        
        return cell
    }
    
    func generateWishlistCountCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WishlistCountTableViewCell.identifier, for: indexPath) as! WishlistCountTableViewCell
        cell.wishlistCount = presenter.favoriteBoxes.count
        
        return cell
    }
 
}
extension WishlistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0: cell = generateWishlistCountCell(tableView, cellForRowAt: indexPath)
        default: cell = generateBoxCell(tableView, cellForRowAt: indexPath)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.favoriteBoxes.count + 1
    }
    
}

extension WishlistViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let viewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Home", identifier: "detailProduct")
        
         self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.row {
        case 0: height = WishlistCountTableViewCell.cellHeight
        default: height = BoxTableViewCell.cellHeight
        }
        
        return height
    }
  
    
}

