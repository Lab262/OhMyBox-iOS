//
//  ShoppingRequestsViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ShoppingRequestsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: ShoppingBoxEmptyView!
    
    var requestBrands: [Int] = []
    var requests: [Int: [Any]] = [:] { // Brand: Products
        didSet {
            requestBrands = requests.keys.sorted()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        
        requests = [1: [], 2: [], 3: []]
        // Do any additional setup after loading the view.
    }

    func registerNibs() {
        tableView.registerNibFrom(ShoppingRequestsHeaderTableViewCell.self)
    }
    
}

extension ShoppingRequestsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return requestBrands.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let brand = requestBrands[section]
        let brandRequests = requests[brand]!
        
        return brandRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        return UITableViewCell()
    }
}

extension ShoppingRequestsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ShoppingRequestsHeaderTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = generateRequestHeader(tableView, viewForHeaderInSection: section)
        
        return header
    }
}

extension ShoppingRequestsViewController { // Cells generation
    
    func generateRequestHeader(_ tableView: UITableView, viewForHeaderInSection section: Int) -> ShoppingRequestsHeaderTableViewCell {
        
        let header = tableView.dequeueReusableCell(withIdentifier: ShoppingRequestsHeaderTableViewCell.identifier) as! ShoppingRequestsHeaderTableViewCell
        
        header.index = section + 1
        
        return header
        
    }
}
