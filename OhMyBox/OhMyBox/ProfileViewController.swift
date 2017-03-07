//
//  ProfileViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 19/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    weak var buttonSegmentedView: ButtonSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        registerNibs()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureNavigationBar() {
        
        navigationBarView.leftBarButton.isHidden = true
    }
    
    func setUpTableView() {
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.layoutIfNeeded()
    }
    
    func registerNibs() {
        tableView.registerNibFrom(ProfilePhotoTableViewCell.self)
        tableView.registerNibFrom(ProfileLabelTableViewCell.self)
        tableView.registerNibFrom(ProfileSegmentTableViewCell.self)
        tableView.registerNibFrom(ProfilePurchaseInfoTableViewCell.self)
    }
    
    func generateProfilePhotoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfilePhotoTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePhotoTableViewCell.identifier) as! ProfilePhotoTableViewCell
        cell.backgroundColor = .clear
        return cell
    }
    
    func generateProfileLabelCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfileLabelTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileLabelTableViewCell.identifier) as! ProfileLabelTableViewCell
        cell.backgroundColor = .clear
        return cell
    }
    
    func generateProfileSegmentedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfileSegmentTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileSegmentTableViewCell.identifier) as! ProfileSegmentTableViewCell
        
        buttonSegmentedView = cell.buttonSegmentedView
        
        return cell
    }
    
    func generateProfilePurchaseInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfilePurchaseInfoTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePurchaseInfoTableViewCell.identifier) as! ProfilePurchaseInfoTableViewCell
        
        return cell
    }
    
    func generateCardInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfilePurchaseInfoTableViewCell {
        
        let cell = generateProfilePurchaseInfoCell(tableView, cellForRowAt: indexPath)
        
        cell.backgroundColor = .clear
        cell.titleLabel.text = "Cartão"
        cell.infoLabel.text = "****8492"
        
        return cell
    }
    
    func generateDeliveryInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfilePurchaseInfoTableViewCell {
        
        let cell = generateProfilePurchaseInfoCell(tableView, cellForRowAt: indexPath)
        
        cell.backgroundColor = .clear
        cell.titleLabel.text = "Aonde entregar"
        cell.infoLabel.text = "Quadra Sqn 309\nAsa Norte,\nBrasilia - DF"
        
        return cell
    }
    
    func generateHeaderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: cell = generateProfilePhotoCell(tableView, cellForRowAt: indexPath)
            case 1: cell = generateProfileLabelCell(tableView, cellForRowAt: indexPath)
            case 2: cell = generateProfileSegmentedCell(tableView, cellForRowAt: indexPath)
            default: cell = UITableViewCell()
            }
        case 1: cell = dataCells(at: indexPath, inTableView: tableView)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    func dataCells(at indexPath: IndexPath, inTableView tableView: UITableView) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if buttonSegmentedView.leftButtonHighlighted { // Meus dados
            
            switch indexPath.section {
            case 1:
                switch indexPath.row {
                case 0: cell = generateCardInfoCell(tableView, cellForRowAt: indexPath)
                case 1: cell = generateDeliveryInfoCell(tableView, cellForRowAt: indexPath)
                default: cell = UITableViewCell()
                }
            default: cell = UITableViewCell()
            }
            
        } else { // Sobre a Box
            
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let number: Int
        
        switch section {
        case 0: number = 3
        case 1: number = 2
        default: number = 0
        }
        return number
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}


extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: height = ProfilePhotoTableViewCell.cellHeight
            case 1: height = ProfileLabelTableViewCell.cellHeight
            case 2: height = ProfileSegmentTableViewCell.cellHeight
            default: height = 0
            }
        case 1: height = UITableViewAutomaticDimension
        default: height = 0
        }
        
        return height
    }
    
    
}
