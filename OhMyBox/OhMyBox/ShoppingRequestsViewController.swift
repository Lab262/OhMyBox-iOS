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
    
    let sectionMargin: CGFloat = 31.0
    let footerView = UIView()
    
    var presenter = RequestsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        
        setUpEmptyView()
        setUpTableView()
        
        footerView.backgroundColor = .clear
        footerView.frame.size = CGSize(width: view.frame.width, height: sectionMargin)
        
        presenter.view = self
        
        presenter.loadPurchaseRequests()
        // Do any additional setup after loading the view.
    }

    func registerNibs() {
        tableView.registerNibFrom(RequestsHeaderTableViewCell.self)
        tableView.registerNibFrom(RequestStatusTableViewCell.self)
        tableView.registerNibFrom(RequestFooterTableViewCell.self)
        tableView.registerNibFrom(BoxRequestTableViewCell.self)
    }
    
    func setUpTableView() {
        
    }
    
    func setUpEmptyView() {
        isEmptyInfo = (#imageLiteral(resourceName: "empty_requests"), "Opa, você precisa fazer umas comprinhas", "Tem vários produtos que são a sua cara aqui na OH MY BOX, não se reprima!", nil)
        
        emptyView.info = isEmptyInfo
        emptyView.buttonHandler = { button in
            self.dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: Notifications.selectHomeViewController, object: nil)
        }
    }
}

extension ShoppingRequestsViewController: RequestsView {
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension ShoppingRequestsViewController: UITableViewDataSource {
    
    func updateIsTableViewHidden(sectionCount: Int) {
        
        let isTableViewHidden = sectionCount == 0
        tableView.isHidden = isTableViewHidden
        emptyView.isHidden = !isTableViewHidden
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let count = presenter.purchaseRequests.count
        
        updateIsTableViewHidden(sectionCount: count)
        return count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0: cell = generateBoxCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateStatusCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generateFooterCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
}

extension ShoppingRequestsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.row {
        case 0: height = BoxRequestTableViewCell.cellHeight
        case 1: height = RequestStatusTableViewCell.cellHeight
        case 2: height = RequestFooterTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return RequestsHeaderTableViewCell.cellHeight
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if case 0...1 = indexPath.row {
            
            performSegue(withIdentifier: SegueIdentifiers.shoppingRequestsToRequestDetail, sender: self)
        }
    }
    
}

// MARK: Cells generation
extension ShoppingRequestsViewController {
    
    func generateRequestHeader(_ tableView: UITableView, viewForHeaderInSection section: Int) -> RequestsHeaderTableViewCell {
        
        let header = tableView.dequeueReusableCell(withIdentifier: RequestsHeaderTableViewCell.identifier) as! RequestsHeaderTableViewCell
        
        header.index = section + 1
        
        return header
        
    }
    
    func generateBoxCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxRequestTableViewCell.identifier) as! BoxRequestTableViewCell
        
        let box = presenter.purchaseRequests[indexPath.section].box
        
        cell.info = (box.name, box.productTypes.count, box.price.doubleValue, [#imageLiteral(resourceName: "product_placeholder"), #imageLiteral(resourceName: "product_placeholder"), #imageLiteral(resourceName: "product_placeholder"), #imageLiteral(resourceName: "product_placeholder")])
        
        return cell
    }
    
    func generateStatusCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> RequestStatusTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RequestStatusTableViewCell.identifier) as! RequestStatusTableViewCell
        
        let request = presenter.purchaseRequests[indexPath.section]
        
        guard let date = request.createdAt else { return cell }
        
        cell.info = (date, "No estoque")
        
        return cell
    }
    
    func generateFooterCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> RequestFooterTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RequestFooterTableViewCell.identifier) as! RequestFooterTableViewCell
        cell.buttonHandler = { button in
            self.performSegue(withIdentifier: SegueIdentifiers.shoppingRequestsToRating, sender: self)
        }
        return cell
    }
}
