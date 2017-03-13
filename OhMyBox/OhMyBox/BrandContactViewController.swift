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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpTableView()
    }

    func registerNibs() {
        tableView.registerNibFrom(BrandContactInfoTableViewCell.self)
        tableView.registerNibFrom(BrandContactLocationTableViewCell.self)
    }

    func setUpTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200.0
    }
    
    func setUpNavigationBar() {
        
        navigationBar.titleLabelText = "CONTATO \(brandName)"
        navigationBar.leftBarButton.setImage(#imageLiteral(resourceName: "back_bold"), for: .normal)
        navigationBar.boxButton.isHidden = true
    }
    
}

extension BrandContactViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0, 1: cell = generateInfoCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generateLocationCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
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
}
