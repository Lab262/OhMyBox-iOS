//
//  RecommendedViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 23/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class RecommendedViewController: UIViewController {
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    var isHiddenRecommendedTitle: Bool = false
    @IBOutlet weak var tableView: UITableView!
    internal var productAllData = [String: [Product]]()
    var titleHeader = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationBarView.titleLabelText = titleHeader
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.configureNavigationBar()
    }
    
    func registerNib(){
        self.tableView.register(UINib(nibName: "ShowProductTableViewCell", bundle: nil), forCellReuseIdentifier: ShowProductTableViewCell.identifier)
    }
    
    func configureNavigationBar() {
    }
    
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowProductTableViewCell.identifier, for: indexPath) as! ShowProductTableViewCell
        
        cell.productImage.image = #imageLiteral(resourceName: "defaultWoman")
        
        
        return cell
    }
    
    func generateHeaderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderRecommendedTableViewCell.identifier, for: indexPath) as! HeaderRecommendedTableViewCell
        
        cell.headerTitleLabel.text = titleHeader

      
        return cell
    }

}
extension RecommendedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if isHiddenRecommendedTitle {
                return generateProductCell(tableView, cellForRowAt: indexPath)
            }
            return generateHeaderCell(tableView, cellForRowAt: indexPath)
        
        default:
            return generateProductCell(tableView, cellForRowAt: indexPath)
        }
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
}

extension RecommendedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row > 0{
            self.performSegue(withIdentifier:"goProductDetail", sender:nil)
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            if isHiddenRecommendedTitle {
                let width = self.view.bounds.size.width * 0.94
                let height = width*1.3
                //1.3
                return height
            }
            return 44
        default:
            let width = self.view.bounds.size.width * 0.94
            let height = width*1.3
            //1.3
            return height
        }
        
    }
}
