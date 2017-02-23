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
        self.registerNib()
        self.configureNavigationBar()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    func configureNavigationBar() {
        
        self.navigationBarView.leftBarButton.isHidden = true
        //self.navigationBarView.boxButton.addTarget(self, action: #selector(actionGoCart(_:)), for: .touchUpInside)
       // self.navigationBarView.searchButton.addTarget(self, action: #selector(searchProducts(_:)), for: .touchUpInside)
        self.navigationBarView.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerNib() {
        
        self.tableView.register(UINib(nibName: "ShowProductTableViewCell", bundle: nil), forCellReuseIdentifier: ShowProductTableViewCell.identifier)

        
    }
    
    func generateFavoriteCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowProductTableViewCell.identifier, for: indexPath) as! ShowProductTableViewCell
        
        cell.productImage.image = #imageLiteral(resourceName: "defaultWomanImage.png")
        
        return cell
    }
 
}
extension WishViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return generateFavoriteCell(tableView, cellForRowAt: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ApplicationState.sharedInstance.favoriteProducts.count
    }
    
   
    
}

extension WishViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let viewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Home", identifier: "detailProduct")
        
         self.navigationController?.pushViewController(viewController!, animated: true)
      
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let width = self.view.bounds.size.width * 0.94
        let height = width*1.3
        
        return height
       
    }
  
    
}

