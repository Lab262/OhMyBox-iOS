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
        footerView.backgroundColor = .clear
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
        emptyView.buttonHandler = { button in
            self.dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: Notifications.selectHomeViewController, object: nil)
        }
    }
    
    func showAllProducts() {
        
    }
    
    func productCellsCount(in section: Int) -> Int {
        let brand = requestBrands[section]
        let brandRequests = requests[brand]!
        
        let count = min(2, brandRequests.count)
        
        return count
    }
    
    func extraProductCount(for brandIndex: Int) -> Int {
        let brand = requestBrands[brandIndex]
        let brandRequests = requests[brand]!
        
        let count = max(0, brandRequests.count - 2)
        
        return count
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
        
        let count = extraProductCount(for: indexPath.section)
        let cellsCount = productCellsCount(in: indexPath.section)
        
        if count > 0 {
            switch indexPath.row {
            case 0..<cellsCount: cell = generateProductCell(tableView, cellForRowAt: indexPath)
            case cellsCount: cell = generateExtraProductsCountCell(tableView, cellForRowAt: indexPath)
            case cellsCount + 1: cell = generateResultsCell(tableView, cellForRowAt: indexPath)
            case cellsCount + 2: cell = generateStatusCell(tableView, cellForRowAt: indexPath)
            case cellsCount + 3: cell = generateFooterCell(tableView, cellForRowAt: indexPath)
            default: cell = UITableViewCell()
            }
        } else {
            switch indexPath.row {
            case 0..<cellsCount: cell = generateProductCell(tableView, cellForRowAt: indexPath)
            case cellsCount: cell = generateResultsCell(tableView, cellForRowAt: indexPath)
            case cellsCount + 1: cell = generateStatusCell(tableView, cellForRowAt: indexPath)
            case cellsCount + 2: cell = generateFooterCell(tableView, cellForRowAt: indexPath)
            default: cell = UITableViewCell()
            }
        }
        
        return cell
    }
}

extension ShoppingRequestsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        let count = extraProductCount(for: indexPath.section)
        let cellsCount = productCellsCount(in: indexPath.section)
        
        if count > 0 {
            switch indexPath.row {
            case 0..<cellsCount: height = ShoppingProductTableViewCell.cellHeight
            case cellsCount: height = ShoppingPlusProductsTableViewCell.cellHeight
            case cellsCount + 1: height = ShoppingResultsTableViewCell.cellHeight
            case cellsCount + 2: height = ShoppingStatusTableViewCell.cellHeight
            case cellsCount + 3: height = ShoppingRequestFooterTableViewCell.cellHeight
            default: height = 0
            }
        } else {
            switch indexPath.row {
            case 0..<cellsCount: height = ShoppingProductTableViewCell.cellHeight
            case cellsCount: height = ShoppingResultsTableViewCell.cellHeight
            case cellsCount + 1: height = ShoppingStatusTableViewCell.cellHeight
            case cellsCount + 2: height = ShoppingRequestFooterTableViewCell.cellHeight
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
        cell.buttonHandler = { button in
            self.performSegue(withIdentifier: SegueIdentifiers.shoppingRequestsToRating, sender: self)
        }
        return cell
    }
    
    func generateExtraProductsCountCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ShoppingPlusProductsTableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: ShoppingPlusProductsTableViewCell.identifier) as! ShoppingPlusProductsTableViewCell
        
        let count = extraProductCount(for: indexPath.section)
        cell.extraProductCount = count
        
        return cell
    }
}
