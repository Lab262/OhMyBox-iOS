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
    var segmentButtonIndexPath = IndexPath.init(row: 1, section: 0)
    var isSegment = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        registerNibs()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureNavigationBar() {
        
        navigationBarView.leftBarButton.isHidden = true
    }
    
    
    
    func registerNibs() {
        tableView.registerNibFrom(ProfilePhotoTableViewCell.self)
        tableView.registerNibFrom(ProfileLabelTableViewCell.self)
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
            default: cell = UITableViewCell()
            }
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
            default: height = 0
            }
        default: height = 0
        }
        
        return height
    }
    
    
}
