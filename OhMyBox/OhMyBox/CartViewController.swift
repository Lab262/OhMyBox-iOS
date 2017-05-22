//
//  CartViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var emptyView: ShoppingBoxEmptyView!
    
    let cellSpacing: CGFloat = 25.0
    let footerView = UIView()
    
    var presenter = CartPresenter()
    
    var isEmptyInfo: ShoppingBoxEmptyView.Info?
    
    var buyButtonHandler: UIButton.ButtonHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpEmptyView()
        
        footerView.backgroundColor = .white
        footerView.frame.size = CGSize(width: view.frame.width, height: cellSpacing)
    }
    
    func registerNibs() {
        tableView.registerNibFrom(BoxTableViewCell.self)
    }
    
    func setUpEmptyView() {
        isEmptyInfo = (#imageLiteral(resourceName: "empty_box"), "Opa, vamos encher essa box, migx?", "Tem vários produtos que são a sua cara para você adicionar aqui", { button in
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
    
    @IBAction func buyButtonAction(_ sender: UIButton!) {
        
        buyButtonHandler?(sender)
    }
}

extension CartViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        updateIsTableViewHidden()
        return presenter.boxes.count
    }
    
    func updateIsTableViewHidden() {
        let count = presenter.boxes.count
        
        let isTableViewHidden = count == 0
        tableView.isHidden = isTableViewHidden
        buyButton.isHidden = isTableViewHidden
        emptyView.isHidden = !isTableViewHidden
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxTableViewCell.identifier) as! BoxTableViewCell
        
        let box = presenter.boxes[indexPath.item]
        
        cell.info = (box.name!, box.boxDescription!, box.price!.doubleValue, #imageLiteral(resourceName: "brand_placeholder_image"), [#imageLiteral(resourceName: "product_placeholder"), #imageLiteral(resourceName: "product_placeholder")])
        
        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BoxTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
}

extension CartViewController: CartView {
    
    func reloadData() {
        
    }
    
    func purchaseRequestSaved(success: Bool, error: Error?) {
        
    }
}
