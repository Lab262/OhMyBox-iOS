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
    var buttonSegmentedViewLeftButtonHighlighted = true
    
    typealias MeasuresType = [(title: String, info: Any)]
    
    var measures: MeasuresType  = [("BLUSA", "P"), ("CALÇA", 36), ("SAPATO", 34)]
    var aboutInfoOptions = ["POLÍTICA DE TROCAS", "POLÍTICA DE VENDAS", "POLÍTICA DE PRIVACIDADE"]
    var aboutOMBOptions = ["SOBRE OH MY BOX", "OI, PODE FALAR!"]
    
    
    
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
        tableView.registerNibFrom(ProfileMeasureTableViewCell.self)
        tableView.registerNibFrom(ProfileCredentialsTableViewCell.self)
        tableView.registerNibFrom(ArrowIndicatorTableViewCell.self)
        tableView.registerNibFrom(HomeTableViewHeaderView.self)
        tableView.registerNibFrom(BrandsHeaderTableViewCell.self)
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
        case 1, 2, 3, 4: cell = dataCells(at: indexPath, inTableView: tableView)
        default: cell = UITableViewCell()
        }
        
        cell.backgroundColor = .clear
        return cell
    }
    
    func dataCells(at indexPath: IndexPath, inTableView tableView: UITableView) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if buttonSegmentedViewLeftButtonHighlighted { // Meus dados
            
            switch indexPath.section {
            case 1:
                switch indexPath.row {
                case 0: cell = generateCardInfoCell(tableView, cellForRowAt: indexPath)
                case 1: cell = generateDeliveryInfoCell(tableView, cellForRowAt: indexPath)
                default: cell = UITableViewCell()
                }
            case 2: cell = generateMeasureInfoCell(tableView, cellForRowAt: indexPath)
            case 3:
                switch indexPath.row {
                case 0: cell = generateUsernameCell(tableView, cellForRowAt: indexPath)
                case 1: cell = generatePasswordCell(tableView, cellForRowAt: indexPath)
                default: cell = UITableViewCell()
                }
            default: cell = UITableViewCell()
            }
            
        } else { // Sobre a Box
            
            let arrowCell = generateAboutInfoCell(tableView, cellForRowAt: indexPath)
            
            switch indexPath.section {
            case 1: arrowCell.title = aboutInfoOptions[indexPath.row]
            case 2: arrowCell.title = aboutOMBOptions[indexPath.row]
            default: break
            }
            
            cell = arrowCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let number: Int
        
        if buttonSegmentedViewLeftButtonHighlighted {
            
            switch section {
            case 0: number = 3
            case 1: number = 2
            case 2: number = measures.count
            case 3: number = 2
            default: number = 0
            }
        } else {
            
            switch section {
            case 0: number = 3
            case 1: number = aboutInfoOptions.count
            case 2: number = aboutOMBOptions.count
            default: number = 0
            }
        }
        
        return number
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let number: Int
        
        if buttonSegmentedViewLeftButtonHighlighted {
            number = 4
        } else {
            number = 3
        }
        
        return number
    }
    
}


extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        if buttonSegmentedViewLeftButtonHighlighted {
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0: height = ProfilePhotoTableViewCell.cellHeight
                case 1: height = ProfileLabelTableViewCell.cellHeight
                case 2: height = ProfileSegmentTableViewCell.cellHeight
                default: height = 0
                }
            case 1: height = UITableViewAutomaticDimension
            case 2: height = ProfileMeasureTableViewCell.cellHeight
            case 3: height = ProfileCredentialsTableViewCell.cellHeight
            default: height = 0
            }
        } else {
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0: height = ProfilePhotoTableViewCell.cellHeight
                case 1: height = ProfileLabelTableViewCell.cellHeight
                case 2: height = ProfileSegmentTableViewCell.cellHeight
                default: height = 0
                }
            default: height = ArrowIndicatorTableViewCell.cellHeight
            }
            
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height: CGFloat
        
        if buttonSegmentedViewLeftButtonHighlighted {
            switch section {
            case 1, 2, 3: height = HomeTableViewHeaderView.cellHeight
            default: height = 0
            }
        } else {
            switch section {
            case 1, 2: height = BrandsHeaderTableViewCell.cellHeight
            default: height = 0
            }
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view: UIView?
        
        if buttonSegmentedViewLeftButtonHighlighted {
            
            switch section {
            case 1:
                let header = generateHeaderView(tableView, viewForHeaderInSection: section)
                header.topLineLabel.text = "DADOS"
                header.bottomLineLabel.text = "DE COMPRA"
                
                view = header
            case 2:
                let header = generateHeaderView(tableView, viewForHeaderInSection: section)
                header.topLineLabel.text = "MINHAS"
                header.bottomLineLabel.text = "MEDIDAS"
                
                view = header
            case 3:
                let header = generateHeaderView(tableView, viewForHeaderInSection: section)
                header.topLineLabel.text = "EMAIL"
                header.bottomLineLabel.text = "E SENHA"
                
                view = header
            default: view = nil
            }
            
        } else {
            
            switch section {
            case 1:
                let header = generateAboutHeaderView(tableView, viewForHeaderInSection: section)
                header.topLineLabel.text = "TUDO O QUE"
                header.bottomLineLabel.text = "VOCÊ PRECISA SABER"
                
                view = header
            case 2:
                let header = generateAboutHeaderView(tableView, viewForHeaderInSection: section)
                header.topLineLabel.text = "DENTRO"
                header.bottomLineLabel.text = "DA BOX"
                
                view = header
            default: view = nil
            }
        }
        
        return view
    }
    
}

// - Mark: Cells generation

extension ProfileViewController {
    
    func generateProfilePhotoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfilePhotoTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePhotoTableViewCell.identifier) as! ProfilePhotoTableViewCell
        
        return cell
    }
    
    func generateProfileLabelCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfileLabelTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileLabelTableViewCell.identifier) as! ProfileLabelTableViewCell
        
        return cell
    }
    
    func generateProfileSegmentedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfileSegmentTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileSegmentTableViewCell.identifier) as! ProfileSegmentTableViewCell
        
        buttonSegmentedView = cell.buttonSegmentedView
        
        let buttonHandler: UIButton.ButtonHandler = { button in
            self.buttonSegmentedViewLeftButtonHighlighted = self.buttonSegmentedView.leftButtonHighlighted
            
            let contentOffset = self.tableView.contentOffset
            self.tableView.reloadData()
            self.tableView.layoutIfNeeded()
            self.tableView.setContentOffset(contentOffset, animated: false)
        }

        
        buttonSegmentedView.leftButtonHandler = buttonHandler
        buttonSegmentedView.rightButtonHandler = buttonHandler
        
        return cell
    }
    
    func generateProfilePurchaseInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfilePurchaseInfoTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePurchaseInfoTableViewCell.identifier) as! ProfilePurchaseInfoTableViewCell
        
        return cell
    }
    
    func generateCardInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfilePurchaseInfoTableViewCell {
        
        let cell = generateProfilePurchaseInfoCell(tableView, cellForRowAt: indexPath)
        
        cell.titleLabel.text = "Cartão"
        cell.infoLabel.text = "****8492"
        
        return cell
    }
    
    func generateDeliveryInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfilePurchaseInfoTableViewCell {
        
        let cell = generateProfilePurchaseInfoCell(tableView, cellForRowAt: indexPath)
        
        cell.titleLabel.text = "Aonde entregar"
        cell.infoLabel.text = "Quadra Sqn 309\nAsa Norte,\nBrasilia - DF"
        
        return cell
    }
    
    func generateMeasureInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfileMeasureTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMeasureTableViewCell.identifier) as! ProfileMeasureTableViewCell
        
        let measure = measures[indexPath.row]
        cell.titleLabel.text = measure.title
        cell.infoLabel.text = String(describing: measure.info)
        
        if indexPath.row == measures.count - 1 {
            cell.setSeparatorHidden(true)
        }
        
        return cell
    }
    
    func generateCredentialsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfileCredentialsTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCredentialsTableViewCell.identifier) as! ProfileCredentialsTableViewCell
        
        return cell
    }
    
    func generateUsernameCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfileCredentialsTableViewCell {
        let cell = generateCredentialsCell(tableView, cellForRowAt: indexPath)
        
        cell.title = "mariabetania@gmail.com"
        
        return cell
    }
    
    func generatePasswordCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProfileCredentialsTableViewCell {
        let cell = generateCredentialsCell(tableView, cellForRowAt: indexPath)
        cell.setSeparatorHidden(true)
        cell.title = "************"
        
        return cell
    }
    
    func generateAboutInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ArrowIndicatorTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArrowIndicatorTableViewCell.identifier) as! ArrowIndicatorTableViewCell
        
        return cell
    }
    
    func generateHeaderView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> HomeTableViewHeaderView {
        
        let header = tableView.dequeueReusableCell(withIdentifier: HomeTableViewHeaderView.identifier) as! HomeTableViewHeaderView
        return header
    }
    
    func generateAboutHeaderView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> BrandsHeaderTableViewCell {
        
        let header = tableView.dequeueReusableCell(withIdentifier: BrandsHeaderTableViewCell.identifier) as! BrandsHeaderTableViewCell
        header.showAllButton.isHidden = true
        return header
    }


}
