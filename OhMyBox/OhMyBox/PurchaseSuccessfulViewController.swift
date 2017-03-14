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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func registerNibs() {
        tableView.registerNibFrom(PurchaseSuccessfulTableViewCell.self)
        tableView.registerNibFrom(PurchaseSuccessfulHeaderTableViewCell.self)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PurchaseSuccessfulTips.tips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return generatePurchaseSuccessfulCell(tableView, cellForRowAt: indexPath)
    }
}

extension PurchaseSuccessfulViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PurchaseSuccessfulTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return PurchaseSuccessfulHeaderTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return generateHeaderView(tableView, viewForHeaderInSection: section)
    }
    
}

extension PurchaseSuccessfulViewController {
    
    func generatePurchaseSuccessfulCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseSuccessfulTableViewCell.identifier) as! PurchaseSuccessfulTableViewCell
        
        cell.title = PurchaseSuccessfulTips.tips[indexPath.row]
        return cell
    }
    
    func generateSubtitleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
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

