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
    
    var isEmptyInfo: ShoppingBoxEmptyView.Info?
    var resultsInfo: ShoppingResultsTableViewCell.Info?
    
    var requestBrands: [Int] = []
    var requests: [Int: [Any]] = [:] { // Brand: Products
        didSet {
            requestBrands = requests.keys.sorted()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpEmptyView()
        setUpTableView()
        requests = [1: [1, 2, 3], 2: [1], 3: [3, 5]]
        // Do any additional setup after loading the view.
    }

    func registerNibs() {
        tableView.registerNibFrom(ShoppingProductTableViewCell.self)
        tableView.registerNibFrom(ShoppingRequestsHeaderTableViewCell.self)
        tableView.registerNibFrom(ShoppingResultsTableViewCell.self)
    }
    
    func setUpTableView() {
        
    }
    
    func setUpEmptyView() {
        isEmptyInfo = (#imageLiteral(resourceName: "empty_requests"), "Opa, você precisa fazer umas comprinhas", "Tem vários produtos que são a sua cara aqui na OH MY BOX, não se reprima!", { button in
            self.showAllProducts()
        })
        
        emptyView.info = isEmptyInfo
    }
    
    func showAllProducts() {
        
    }
}

extension ShoppingRequestsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        updateIsTableViewHidden()
        return requestBrands.count
    }
    
    func updateIsTableViewHidden() {
        let count = requestBrands.count
        
        let isTableViewHidden = count == 0
        tableView.isHidden = isTableViewHidden
        emptyView.isHidden = !isTableViewHidden
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let brand = requestBrands[section]
        let brandRequests = requests[brand]!
        
        return brandRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0, 1: cell = generateProductCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generateResultsCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
}

extension ShoppingRequestsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.row {
        case 0, 1: height = ShoppingProductTableViewCell.cellHeight
        case 2: height = ShoppingResultsTableViewCell.cellHeight
        default: height = 0
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ShoppingRequestsHeaderTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = generateRequestHeader(tableView, viewForHeaderInSection: section)
        header.backgroundColor = .white
        
        return header
    }
}

extension ShoppingRequestsViewController { // Cells generation
    
    func generateRequestHeader(_ tableView: UITableView, viewForHeaderInSection section: Int) -> ShoppingRequestsHeaderTableViewCell {
        
        let header = tableView.dequeueReusableCell(withIdentifier: ShoppingRequestsHeaderTableViewCell.identifier) as! ShoppingRequestsHeaderTableViewCell
        
        header.index = section + 1
        
        return header
        
    }
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ShoppingProductTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingProductTableViewCell.identifier) as! ShoppingProductTableViewCell
        
        cell.info = (#imageLiteral(resourceName: "product_placeholder"), "SAIA COLLECTION", "fashion store", 1, 50)
        
        return cell
    }
    
    func generateResultsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ShoppingResultsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingResultsTableViewCell.identifier) as! ShoppingResultsTableViewCell
        
        cell.info = (0, 100)
        
        return cell
    }
}
