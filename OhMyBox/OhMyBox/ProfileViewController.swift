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
        
    }
    
    func generatePhotoProfileCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoProfileTableViewCell.identifier, for: indexPath) as! PhotoProfileTableViewCell
        cell.scrollViewDidScroll(self.tableView)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func generateSegmentCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SegmentTableViewCell.identifier, for: indexPath) as! SegmentTableViewCell
        cell.selectionStyle = .none
        cell.aboutBoxButton.addTarget(self, action: #selector(selectAboutBox(_:)), for: .touchUpInside)
        cell.dataUserButton.addTarget(self, action:#selector(selectDateUser(_:)), for:.touchUpInside)
        
        
        return cell
    }
    func generateMeasuereCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MeasuresUserTableViewCell.identifier, for: indexPath) as! MeasuresUserTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func selectAboutBox (_ sender: UIButton) {
        let cell = tableView.dequeueReusableCell(withIdentifier: SegmentTableViewCell.identifier, for:segmentButtonIndexPath) as! SegmentTableViewCell
        
        cell.aboutBoxButton.setBackgroundImage(#imageLiteral(resourceName: "profile_mydata_button"), for: UIControlState.normal)
            cell.dataUserButton.setBackgroundImage(#imageLiteral(resourceName: "profile_about_button"), for: UIControlState.normal)

        cell.aboutBoxButton.setTitleColor(UIColor.white, for:UIControlState.normal)
        cell.dataUserButton.setTitleColor(UIColor.hexStringToUIColor(hex:"b8b8b8"), for:UIControlState.normal)
            self.isSegment = false
            self.tableView.reloadData()
    
    }
 
    
    func selectDateUser (_ sender: UIButton) {
        let cell = tableView.dequeueReusableCell(withIdentifier: SegmentTableViewCell.identifier, for:segmentButtonIndexPath) as! SegmentTableViewCell
        cell.aboutBoxButton.setBackgroundImage(#imageLiteral(resourceName: "profile_about_button"), for: UIControlState.normal)

        cell.dataUserButton.setBackgroundImage(#imageLiteral(resourceName: "profile_mydata_button"), for: UIControlState.normal)
                       self.isSegment = true
            cell.dataUserButton.setTitleColor(UIColor.white, for:UIControlState.normal)
            cell.aboutBoxButton.setTitleColor(UIColor.hexStringToUIColor(hex:"b8b8b8"), for:UIControlState.normal)
        
        self.tableView.reloadData()
    }
    
    
    func generateHeaderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
}


extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if isSegment{
            switch indexPath.section {
                
                case 0:
                    switch indexPath.row {
                        case 0:
                            return 260
                    case 1:
                        return 100
                    default:
                        return 0
                    }
                
                case 1:
                    switch indexPath.row {
                        case 0:
                            return 70
                    case 1:
                        return 100
                    case 2:
                        return 100
                    default:
                        return 0
                }
                case 2:
                    switch indexPath.row {
                        case 0:
                            return 70
                    case 1:
                        return 50
                    case 2:
                        return 50
                    case 3:
                        return 50
                    default:
                        return 0
                }
                case 3:
                    switch indexPath.row {
                        case 0:
                            return 70
                    case 1:
                        return 70
                    case 2:
                        return 70
                    default:
                        return 0
                }
                default:
                    return 100
            }
        }else {
            switch indexPath.section {
                    case 0:
                        switch indexPath.row {
                        case 0:
                            return 260
                        case 1:
                            return 100
                        default:
                            return 0
                    }
                    case 1:
                        switch indexPath.row {
                        case 0:
                            return 70
                        case 1:
                            return 70
                        case 2:
                            return 70
                        case 3:
                            return 70
                        case 4:
                            return 100
                        default:
                            return 0
                    }
                case 2:
                    switch indexPath.row {
                    case 0:
                        return 70
                    case 1:
                        return 50
                    case 2:
                        return 50
                    default:
                        return 0
                }
                default:
                    return 100
                }
            }
        }


}
