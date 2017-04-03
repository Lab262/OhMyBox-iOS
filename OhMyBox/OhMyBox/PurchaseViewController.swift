//
//  PurchaseViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products: [Any] = [1, 2, 3]
    var purchaseInfo: [PurchaseInfoTableViewCell.Info] = [("Cartão", "****8492"), ("Aonde entregar", "Quadra Sqn 309 Asa Norte, Brasília - DF")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20.0, right: 0)
        // Do any additional setup after loading the view.
    }
    
    func registerNibs() {
        tableView.registerNibFrom(PurchaseButtonHeaderTableViewCell.self)
        tableView.registerNibFrom(PurchaseHeaderTableViewCell.self)
        tableView.registerNibFrom(PurchaseInfoTableViewCell.self)
        tableView.registerNibFrom(ShoppingProductTableViewCell.self)
        tableView.registerNibFrom(ShoppingResultsTableViewCell.self)
    }
    
    func setUpTableView() {
        
    }
    
    @IBAction func purchaseButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifiers.purchaseToPurchaseSuccessful, sender: self)
    }
    
}

extension PurchaseViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows: Int
        
        switch section {
        case 0: numberOfRows = products.count + 1
        case 1: numberOfRows = 2
        default: numberOfRows = 0
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0..<products.count: cell = generateProductCell(tableView, cellForRowAt: indexPath)
            case products.count: cell = generateResultsCell(tableView, cellForRowAt: indexPath)
            default: cell = UITableViewCell()
            }
        case 1: cell = generatePurchaseInfoCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
}

extension PurchaseViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0..<products.count: height = ShoppingProductTableViewCell.cellHeight
            case products.count: height = ShoppingResultsTableViewCell.cellHeight
            default: height = 0
            }
        case 1: height = PurchaseInfoTableViewCell.cellHeight
        default: height = 0
        }
    
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height: CGFloat
        
        switch section {
        case 0: height = PurchaseHeaderTableViewCell.cellHeight
        case 1: height = PurchaseButtonHeaderTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header: UIView?
        
        switch section {
        case 0: header = generateHeaderView(tableView, viewForHeaderInSection: section)
        case 1: header = generateButtonHeaderView(tableView, viewForHeaderInSection: section)
        default: header = nil
        }
        
        return header
    }
    
}

extension PurchaseViewController {
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ShoppingProductTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingProductTableViewCell.identifier) as! ShoppingProductTableViewCell
        
        return cell
    }
    
    func generateResultsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ShoppingResultsTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingResultsTableViewCell.identifier) as! ShoppingResultsTableViewCell
        cell.setSeparatorHidden(true)
        
        return cell
    }
    
    func generatePurchaseInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> PurchaseInfoTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseInfoTableViewCell.identifier) as! PurchaseInfoTableViewCell
        cell.info = purchaseInfo[indexPath.row]
        
        cell.setSeparatorHidden(indexPath.row == purchaseInfo.count - 1)
        
        return cell
    }
    
    func generateHeaderView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let header = tableView.dequeueReusableCell(withIdentifier: PurchaseHeaderTableViewCell.identifier) as! PurchaseHeaderTableViewCell
        header.title = "LISTA"
        return header
    }
    
    func generateButtonHeaderView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: PurchaseButtonHeaderTableViewCell.identifier) as! PurchaseButtonHeaderTableViewCell
        header.info = ("PAGAMENTO", "E ENDEREÇO")
        return header
    }

}
