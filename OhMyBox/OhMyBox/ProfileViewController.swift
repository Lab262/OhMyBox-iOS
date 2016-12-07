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
        self.configureNavigationBar()
        self.registerNib()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func configureNavigationBar() {
        
        self.navigationBarView.leftBarButton.isHidden = true
        self.navigationBarView.searchButton.isHidden = true
    }
    
    
    
    func registerNib() {
        
        self.tableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderTitleTableViewCell.identifier)
        
        self.tableView.register(UINib(nibName: "DataUserTextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: DataUserTextFieldTableViewCell.identifier)
        
        self.tableView.register(UINib(nibName: "MeasuresUserTableViewCell", bundle: nil), forCellReuseIdentifier: MeasuresUserTableViewCell.identifier)

          self.tableView.register(UINib(nibName: "SimpleTextTableViewCell", bundle: nil), forCellReuseIdentifier: SimpleTextTableViewCell.identifier)
    
          self.tableView.register(UINib(nibName: "TermTableViewCell", bundle: nil), forCellReuseIdentifier: TermTableViewCell.identifier)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
        
        return cell
    }
    
    
    

    

}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        if indexPath.section == 0{
            if indexPath.row == 0{
                return generatePhotoProfileCell(tableView, cellForRowAt: indexPath)
            
            }else if indexPath.row == 1 {
                return generateSegmentCell(tableView, cellForRowAt: indexPath)
            }else {
                return UITableViewCell()
            }
        }else if indexPath.section == 1{
            if isSegment{
                    if indexPath.row == 0{
                        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
                        cell.firstTitleLineLabel.text = "DADOS"
                        cell.secondTitleLineLabel.text = "DE COMPRA"
                        cell.iconImage.image = UIImage(named:"textureText1")
                        cell.titleButtonLabel.text = "Editar"
                        cell.showAllButton.isHidden = false
                     
                    
                        return cell
                    
                }else if indexPath.row == 1 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: DataUserTextFieldTableViewCell.identifier, for: indexPath) as! DataUserTextFieldTableViewCell
                        cell.nameFieldLabel.text = "Cartão"
                        cell.infoUserLabel.text = "*****-3336"
                        
                    
                    
                        return cell
                }else if indexPath.row == 2 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: DataUserTextFieldTableViewCell.identifier, for: indexPath) as! DataUserTextFieldTableViewCell
                        cell.nameFieldLabel.text = "Aonde entregar"
                        cell.infoUserLabel.text = "Quadra Sqn 309 Asa"
                        cell.selectionStyle = .none
                    
                        return cell
                }else {
                        return UITableViewCell()
                }
            }else {
                if indexPath.row == 0{
                        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
                        cell.firstTitleLineLabel.text = "TUDO O QUE VOCE"
                        cell.secondTitleLineLabel.text = "PRECISA SABER"
                        cell.iconImage.image = UIImage(named:"icon_header_profile")
                        cell.selectionStyle = .none
                        cell.titleButtonLabel.text = ""
                        cell.showAllButton.isHidden = true
                    return cell
                    
                }else if indexPath.row == 1 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: TermTableViewCell.identifier, for: indexPath) as! TermTableViewCell
                        cell.frameIconView.backgroundColor = UIColor.colorWithHexString("FD8693")
                        cell.selectionStyle = .none
                    
                        return cell
                }else if indexPath.row == 2 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: TermTableViewCell.identifier, for: indexPath) as! TermTableViewCell
                    cell.frameIconView.backgroundColor = UIColor.colorWithHexString("25D76B")
                    cell.selectionStyle = .none
                        cell.selectionStyle = .none
                    
                        return cell
                }else if indexPath.row == 3 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: TermTableViewCell.identifier, for: indexPath) as! TermTableViewCell
                    cell.frameIconView.backgroundColor = UIColor.colorWithHexString("DF417C")
                    cell.selectionStyle = .none
                  
                    
                    return cell
                }else {
                        return UITableViewCell()
                }

            }
           
        }else if indexPath.section == 2{
            if isSegment{
                    if indexPath.row == 0{
                        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
                        cell.firstTitleLineLabel.text = "MINHAS"
                        cell.secondTitleLineLabel.text = "MEDIDAS"
                        cell.iconImage.image = UIImage(named:"textureText2")
                        cell.showAllButton.isHidden = false
                        cell.titleButtonLabel.text = "Editar"
                        

                        
                        cell.selectionStyle = .none
                    
                        return cell
                    
                }else if indexPath.row == 1{
                        let cell = tableView.dequeueReusableCell(withIdentifier: MeasuresUserTableViewCell.identifier, for: indexPath) as! MeasuresUserTableViewCell
                        cell.sizeImage.image = UIImage(named:"t-shirtIcon")
                        cell.titleMeasure.text = "Blusa"
                        cell.TitleSizeLabel.text = "P"
                        cell.selectionStyle = .none
                    
                        return cell
                    
                }else if indexPath.row == 2{
                        let cell = tableView.dequeueReusableCell(withIdentifier: MeasuresUserTableViewCell.identifier, for: indexPath) as! MeasuresUserTableViewCell
                        cell.sizeImage.image = UIImage(named:"pantsIcon")
                        cell.titleMeasure.text = "Cintura"
                        cell.TitleSizeLabel.text = "36"
                        cell.selectionStyle = .none
                    
                        return cell
                    
                }else if indexPath.row == 3{
                        let cell = tableView.dequeueReusableCell(withIdentifier: MeasuresUserTableViewCell.identifier, for: indexPath) as! MeasuresUserTableViewCell
                        cell.sizeImage.image = UIImage(named:"shoes_Icon")
                        cell.titleMeasure.text = "Calçado"
                        cell.TitleSizeLabel.text = "34"
                        cell.selectionStyle = .none
                        
                        return cell
                    
                }else {
                    return UITableViewCell()
                }

            }else {
                if indexPath.row == 0{
                        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
                        cell.firstTitleLineLabel.text = "OLHA"
                        cell.secondTitleLineLabel.text = "A GENTE"
                        cell.iconImage.image = UIImage(named:"icon_header_profile")
                        cell.titleButtonLabel.text = ""
                        cell.showAllButton.isHidden = true
                    
                        return cell
                    
                }else if indexPath.row == 1{
                        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTextTableViewCell.identifier, for: indexPath) as! SimpleTextTableViewCell
                        cell.simpleTitleLabel.text = "SOBRE O OH MY BOX"
                    
                    
                        return cell
                    
                }else if indexPath.row == 2{
                        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTextTableViewCell.identifier, for: indexPath) as! SimpleTextTableViewCell
                        cell.simpleTitleLabel.text = "FALE COM A GENTE!"

                        cell.selectionStyle = .none
                    
                        return cell
                    
                }else {
                    return UITableViewCell()
                }
            }
        
        }else if indexPath.section == 3{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
                cell.firstTitleLineLabel.text = "EMAIL"
                cell.secondTitleLineLabel.text = "E SENHA"
                cell.iconImage.image = UIImage(named:"textTexture3")
                cell.showAllButton.setTitle("Editar", for: UIControlState.normal)
                cell.showAllButton.setBackgroundImage(#imageLiteral(resourceName: "profile_edit_button"), for:UIControlState.normal)

                cell.selectionStyle = .none

                return cell
                
            }else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTextTableViewCell.identifier, for: indexPath) as! SimpleTextTableViewCell
                cell.simpleTitleLabel.text = "mariabetania@gmail.com"
                cell.selectionStyle = .none

                return cell
                
            }else if indexPath.row == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTextTableViewCell.identifier, for: indexPath) as! SimpleTextTableViewCell
                cell.simpleTitleLabel.text = "***********"
                cell.selectionStyle = .none

                return cell
                
            }else {
                 return UITableViewCell()
            }
            
        }else{
            return UITableViewCell()
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSegment{
            return 4
        }else {
            return 3
        }
        
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
