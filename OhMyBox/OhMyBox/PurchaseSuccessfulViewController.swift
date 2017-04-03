//
//  PurchaseSuccessfulViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 14/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PurchaseSuccessfulViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var headerImageHeightConstraint: NSLayoutConstraint!
    let headerImageDefaultHeight: CGFloat = 182.0
    let headerImageTopMargin: CGFloat = 37.0
    
    let headerInfo: PurchaseSuccessfulHeaderTableViewCell.Info = ("TUDO CERTO", "COM SUA COMPRA!", "AQUI ALGUNS PASSOS PARA FICAR TUDO BELEZA")
    let footerButtonTitles: [String] = ["Acompanhar pedido", "Entendi, obrigado!"]
    var footerButtonHandlers: [UIButton.ButtonHandler] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpTableView()
        
        let followRequestHandler: UIButton.ButtonHandler = { button in
            NotificationCenter.default.post(name: Notifications.selectHomeViewController, object: nil)
            self.dismiss(animated: true, completion: {
                NotificationCenter.default.post(name: Notifications.goToBoxViewController, object: nil)
            })
        }
        
        let dismissHandler: UIButton.ButtonHandler = { button in
            NotificationCenter.default.post(name: Notifications.selectHomeViewController, object: nil)
            self.dismiss(animated: true, completion: nil)
        }
        
        footerButtonHandlers = [followRequestHandler, dismissHandler]
        // Do any additional setup after loading the view.
    }
    
    func registerNibs() {
        tableView.registerNibFrom(PurchaseSuccessfulTableViewCell.self)
        tableView.registerNibFrom(PurchaseSuccessfulHeaderTableViewCell.self)
        tableView.registerNibFrom(PurchaseSuccessfulButtonTableViewCell.self)
    }
    
    func setUpTableView() {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200.0
        
        tableView.contentInset = UIEdgeInsets(top: headerImageDefaultHeight + headerImageTopMargin, left: 0, bottom: 20.0, right: 0)
        tableView.backgroundColor = .clear
    }

}

extension PurchaseSuccessfulViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows: Int
        
        switch section {
        case 0: numberOfRows = PurchaseSuccessfulTips.tips.count
        case 1: numberOfRows = footerButtonTitles.count
        default: numberOfRows = 0
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0: cell = generatePurchaseSuccessfulCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateButtonCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
}

extension PurchaseSuccessfulViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.section {
        case 0: height = PurchaseSuccessfulTableViewCell.cellHeight
        case 1: height = PurchaseSuccessfulButtonTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height: CGFloat
        
        switch section {
        case 0: height = PurchaseSuccessfulHeaderTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view: UIView?
        
        switch section {
        case 0: view = generateHeaderView(tableView, viewForHeaderInSection: section)
        default: view = nil
        }
        
        return view
    }
    
}

extension PurchaseSuccessfulViewController {
    
    func generatePurchaseSuccessfulCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseSuccessfulTableViewCell.identifier) as! PurchaseSuccessfulTableViewCell
        
        cell.title = PurchaseSuccessfulTips.tips[indexPath.row]
        return cell
    }
    
    func generateButtonCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseSuccessfulButtonTableViewCell.identifier) as! PurchaseSuccessfulButtonTableViewCell
        
        cell.buttonTitle = footerButtonTitles[indexPath.row]
        cell.buttonHandler = footerButtonHandlers[indexPath.row]
        return cell
    }
    
    func generateHeaderView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: PurchaseSuccessfulHeaderTableViewCell.identifier) as! PurchaseSuccessfulHeaderTableViewCell
        header.info = headerInfo
        
        header.backgroundColor = .white
        
        return header
    }
}

extension PurchaseSuccessfulViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        
        updateImageScale(yOffset)
        
    }
    
    func updateImageScale(_ yOffset: CGFloat) {
        
        if yOffset > 0 {
            headerImageHeightConstraint.constant = headerImageDefaultHeight - yOffset
        } else if headerImageHeightConstraint.constant != headerImageDefaultHeight {
            headerImageHeightConstraint.constant = headerImageDefaultHeight
        }
    }
    
}

