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
    
    let sectionMargin: CGFloat = 31.0
    let footerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpEmptyView()
        setUpTableView()
        requests = [1: [1, 2, 3, 4], 2: [1], 3: [3, 5]]
        footerView.backgroundColor = .white
        footerView.frame.size = CGSize(width: view.frame.width, height: sectionMargin)
        // Do any additional setup after loading the view.
    }

    func registerNibs() {
        tableView.registerNibFrom(ShoppingProductTableViewCell.self)
        tableView.registerNibFrom(ShoppingRequestsHeaderTableViewCell.self)
        tableView.registerNibFrom(ShoppingResultsTableViewCell.self)
        tableView.registerNibFrom(ShoppingStatusTableViewCell.self)
        tableView.registerNibFrom(ShoppingRequestFooterTableViewCell.self)
        tableView.registerNibFrom(ShoppingPlusProductsTableViewCell.self)
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
    
    func updateIsTableViewHidden() {
        let count = requestBrands.count
        
        let isTableViewHidden = count == 0
        tableView.isHidden = isTableViewHidden
        emptyView.isHidden = !isTableViewHidden
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        updateIsTableViewHidden()
        return requestBrands.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let brand = requestBrands[section]
        let brandRequests = requests[brand]!
        
        let footerCellsCount = 3
        
        return min(brandRequests.count, 3) + footerCellsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell
        
        let brand = requestBrands[indexPath.section]
        let brandRequests = requests[brand]!
        
        let productCellsCount = min(brandRequests.count, 2)
        let extraProductCount = max(0, brandRequests.count - 2)
        
        if extraProductCount > 0 {
            switch indexPath.row {
            case 0..<productCellsCount: cell = generateProductCell(tableView, cellForRowAt: indexPath)
            case productCellsCount: cell = generateExtraProductsCountCell(tableView, cellForRowAt: indexPath)
            case productCellsCount + 1: cell = generateResultsCell(tableView, cellForRowAt: indexPath)
            case productCellsCount + 2: cell = generateStatusCell(tableView, cellForRowAt: indexPath)
            case productCellsCount + 3: cell = generateFooterCell(tableView, cellForRowAt: indexPath)
            default: cell = UITableViewCell()
            }
        } else {
            switch indexPath.row {
            case 0..<productCellsCount: cell = generateProductCell(tableView, cellForRowAt: indexPath)
            case productCellsCount: cell = generateResultsCell(tableView, cellForRowAt: indexPath)
            case productCellsCount + 1: cell = generateStatusCell(tableView, cellForRowAt: indexPath)
            case productCellsCount + 2: cell = generateFooterCell(tableView, cellForRowAt: indexPath)
            default: cell = UITableViewCell()
            }
        }
        
        
        
        return cell
    }
}

extension ShoppingRequestsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        let brand = requestBrands[indexPath.section]
        let brandRequests = requests[brand]!
        
        let productCellsCount = min(brandRequests.count, 2)
        let extraProductCount = max(0, brandRequests.count - 2)
        
        if extraProductCount > 0 {
            switch indexPath.row {
            case 0..<productCellsCount: height = ShoppingProductTableViewCell.cellHeight
            case productCellsCount: height = ShoppingPlusProductsTableViewCell.cellHeight
            case productCellsCount + 1: height = ShoppingResultsTableViewCell.cellHeight
            case productCellsCount + 2: height = ShoppingStatusTableViewCell.cellHeight
            case productCellsCount + 3: height = ShoppingRequestFooterTableViewCell.cellHeight
            default: height = 0
            }
        } else {
            switch indexPath.row {
            case 0..<productCellsCount: height = ShoppingProductTableViewCell.cellHeight
            case productCellsCount: height = ShoppingResultsTableViewCell.cellHeight
            case productCellsCount + 1: height = ShoppingStatusTableViewCell.cellHeight
            case productCellsCount + 2: height = ShoppingRequestFooterTableViewCell.cellHeight
            default: height = 0
            }
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sectionMargin
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
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
    
    func generateStatusCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ShoppingStatusTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingStatusTableViewCell.identifier) as! ShoppingStatusTableViewCell
        
        cell.info = (Date(), "No estoque")
        
        return cell
    }
    
    func generateFooterCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ShoppingRequestFooterTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingRequestFooterTableViewCell.identifier) as! ShoppingRequestFooterTableViewCell
        
        return cell
    }
    
    func generateExtraProductsCountCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ShoppingPlusProductsTableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: ShoppingPlusProductsTableViewCell.identifier) as! ShoppingPlusProductsTableViewCell
        
        let brand = requestBrands[indexPath.section]
        let brandRequests = requests[brand]!
        
        let extraProductCount = max(0, brandRequests.count - 2)
        cell.extraProductCount = extraProductCount
        
        return cell
    }
}
