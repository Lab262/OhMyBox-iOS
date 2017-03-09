//
//  ShoppingBoxViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingBoxViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buyButton: UIButton!
    
    let cellSpacing: CGFloat = 25.0
    let footerView = UIView()
    
    var products: [Any] = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        
        footerView.backgroundColor = .white
        footerView.frame.size = CGSize(width: view.frame.width, height: cellSpacing)
    }

    func registerNibs() {
        tableView.registerNibFrom(ShoppingBoxTableViewCell.self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ShoppingBoxViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBoxTableViewCell.identifier) as! ShoppingBoxTableViewCell
        
        return cell
    }
}

extension ShoppingBoxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ShoppingBoxTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
}
