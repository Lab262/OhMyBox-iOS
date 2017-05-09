//
//  BrandContactViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BrandContactViewController: UIViewController {

    @IBOutlet weak var navigationBar: IconNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var brandName = ""
    var emailInfo: BrandContactInfoTableViewCell.Info?
    var phoneInfo: BrandContactInfoTableViewCell.Info?
    var locationInfo: BrandContactLocationTableViewCell.Info?
    var socialNetworkInfos: [BrandContactSocialNetworkTableViewCell.Info] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavigationBar()
    }

    func registerNibs() {
        tableView.registerNibFrom(BrandContactInfoTableViewCell.self)
        tableView.registerNibFrom(BrandContactLocationTableViewCell.self)
        tableView.registerNibFrom(BrandContactHeaderTableViewCell.self)
        tableView.registerNibFrom(BrandContactSocialNetworkTableViewCell.self)
    }

    func setUpTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200.0
    }
    
    func setUpNavigationBar() {
        
        navigationBar.titleLabelText = "CONTATO \(brandName)"
        navigationBar.leftBarButton.setImage(#imageLiteral(resourceName: "back_bold"), for: .normal)
        navigationBar.showsRightBarButton = false
    }
    
}

extension BrandContactViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowsCount: Int
        
        switch section {
        case 0: rowsCount = 3
        case 1: rowsCount = socialNetworkInfos.count
        default: rowsCount = 0
        }
        
        return rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0, 1: cell = generateInfoCell(tableView, cellForRowAt: indexPath)
            case 2: cell = generateLocationCell(tableView, cellForRowAt: indexPath)
            default: cell = UITableViewCell()
            }
        case 1:
            cell = generateSocialNetworkCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view: UIView?
        
        switch section {
        case 1: view = generateHeader(tableView, viewForHeaderInSection: section)
        default: view = nil
        }
        
        return view
    }
}

extension BrandContactViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0, 1: height = BrandContactInfoTableViewCell.cellHeight
            case 2: height = BrandContactLocationTableViewCell.cellHeight
            default: height = 0
            }
        case 1: height = BrandContactSocialNetworkTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height: CGFloat
        
        switch section {
        case 1: height = BrandContactHeaderTableViewCell.cellHeight
        default: height = CGFloat.leastNonzeroMagnitude
        }
        
        return height
    }
}

// Mark: - Cells generation
extension BrandContactViewController {
    
    func generateInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> BrandContactInfoTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandContactInfoTableViewCell.identifier) as! BrandContactInfoTableViewCell
        
        switch indexPath.row {
        case 0: cell.info = emailInfo
        case 1: cell.info = phoneInfo
        default: cell.info = nil
        }
        
        return cell
    }
    
    func generateLocationCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> BrandContactLocationTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandContactLocationTableViewCell.identifier) as! BrandContactLocationTableViewCell
        
        cell.info = locationInfo
        
        return cell
    }
    
    func generateSocialNetworkCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> BrandContactSocialNetworkTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandContactSocialNetworkTableViewCell.identifier) as! BrandContactSocialNetworkTableViewCell
        cell.info = socialNetworkInfos[indexPath.row]
        return cell
    }

    
    func generateHeader(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: BrandContactHeaderTableViewCell.identifier) as! BrandContactHeaderTableViewCell
        
        header.info = ("BOLADO", "NAS REDES")
        
        return header
    }
}
