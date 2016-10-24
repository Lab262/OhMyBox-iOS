//
//  HomeViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewSearch: UIView?
    var searchController: UISearchController!
    var leftButtonItem: UIBarButtonItem?
    var rightButtonItem: UIBarButtonItem?
    @IBOutlet weak var searchBarBoxButton: UIBarButtonItem!
    @IBOutlet weak var searchBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
         self.rightButtonItem = UIBarButtonItem(image: UIImage(named:"searchIcon"), style: .done, target: self, action: #selector(searchProducts(_:)))
    
    }
    override func viewWillAppear(_ animated: Bool) {
        self.configureSearchBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        if self.searchController.isActive {
            self.searchController.isActive = false
            self.searchController.searchBar.resignFirstResponder()
        }
    }
    
    func registerNib() {
        
        self.tableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderTitleTableViewCell.identifier)
        self.tableView.register(UINib(nibName: "ShowCaseCollectionViewCell", bundle: nil), forCellReuseIdentifier: ShowCaseCollectionViewCell.identifier)
          self.tableView.register(UINib(nibName: "PromotionTableViewCell", bundle: nil), forCellReuseIdentifier: PromotionTableViewCell.identifier)
    
    }
    @IBAction func searchProducts(_ sender: AnyObject) {
        self.showSearchBar()
    
    }
    
    
    func configureSearchBar () {
        //self.searchBarButton.isEnabled = false
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.setImage(UIImage(named: "searchIcon"), for: .search, state: UIControlState())
        self.searchController.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Buscar"
        self.searchController.searchBar.setValue("Cancelar", forKey: "_cancelButtonText")
        
        self.searchController.searchBar.setBackgroundImage(ViewUtil.imageFromColor(.clear, forSize: self.searchController.searchBar.frame.size, withCornerRadius: 0), for: .any, barMetrics: .default)
        
        
        self.searchController.searchBar.tintColor = UIColor.colorWithHexString("AFAFB3")
        
        searchController.hidesBottomBarWhenPushed = true
        let searchField = self.searchController.searchBar.value(forKey: "searchField") as? UITextField
        
        
        searchField?.backgroundColor = UIColor.colorWithHexString("F4F4F4")
        searchField?.textColor = UIColor.black
        searchField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Buscar", comment: ""), attributes: [NSForegroundColorAttributeName: UIColor.colorWithHexString("AFAFB3")])
       //   searchBarButton.isEnabled = true
        
        
        
        self.viewSearch = UIView(frame: CGRect(x: self.searchController.searchBar.frame.origin.x, y: self.searchController.searchBar.frame.origin.y, width: self.searchController.searchBar.bounds.size.width-15, height: self.searchController.searchBar.bounds.size.height))
        
        
        self.viewSearch?.backgroundColor = UIColor.clear
        
        self.viewSearch?.addSubview(self.searchController.searchBar)
        
    }
   
    func showSearchBar() {
        
        self.searchController.isActive = true
        self.searchController.searchBar.alpha = 0
       // searchBarButton.isEnabled = false
       // searchBarButton.tintColor = UIColor.clear
       
        let leftNavBarButton = UIBarButtonItem(customView: self.viewSearch!)
        navigationItem.setLeftBarButton(leftNavBarButton, animated: true)
        
        navigationItem.setRightBarButton(nil, animated: true)
        UIView.animate(withDuration: 0.2, animations: {
            self.searchController.searchBar.alpha = 1
            }, completion: { finished in
                self.searchController.searchBar.becomeFirstResponder()
        })
    }
    

}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.section == 0{
            switch indexPath.row {
                case 0:
                    return self.generateHeaderClosetCell(tableView, cellForRowAt: indexPath)
                case 1:
                    return self.generateClosetCell(tableView, cellForRowAt: indexPath)
                default:
                    return UITableViewCell()
            }
        }else if indexPath.section == 1{
            switch indexPath.row {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
                    cell.firstTitleLineLabel.text = "OLHA AS"
                    cell.secondTitleLineLabel.text = "NOVIDADES"
                    cell.iconImage.image = UIImage(named:"textureSectionImage")
                    
                    return cell
                case 1:
                    return self.generateProductCell(tableView, cellForRowAt: indexPath)
                default:
                    return UITableViewCell()
            }
        }else if indexPath.section == 2{
            switch indexPath.row {
            case 0:
                return self.generatePromotionCell(tableView, cellForRowAt: indexPath)
            default:
                return UITableViewCell()
            }
        
        }else {
            return UITableViewCell()
        }
        
        
        
        
    }
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        
        return cell
    }
    
    func generatePromotionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PromotionTableViewCell.identifier, for: indexPath) as! PromotionTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func generateClosetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetTableViewCell.identifier, for: indexPath) as! ClosetTableViewCell
        cell.delegate = self 
        return cell
    }
    
    func generateHeaderClosetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            
            case 0:
            
            switch indexPath.row {
            case 0:
                return 70
            case 1:
                return 310
            default:
                return 0
            }
            
        case 1:
            switch indexPath.row {
            case 0:
                return 70
            case 1:
                return 310
            default:
                return 0
            }
        case 2:
            switch indexPath.row {
            case 0:
                return 170
            default:
                return 0
            }

        default:
            return 100
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section  == 0 {
            
            let header = tableView.dequeueReusableCell(withIdentifier:HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
            
            header.firstTitleLineLabel.text = "Recomendados"
            header.secondTitleLineLabel.text = "Para Você"
            
            return header
        }else {
            let view = UIView()
            view.backgroundColor = UIColor.clear
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0.1
        } else {
            return 70
            
        }
    }
  
}
extension HomeViewController: callSegueProtocol {

    func callRecommended() {
        self.performSegue(withIdentifier:"goRecommended", sender:self)
    }
}

extension HomeViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    func presentSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.becomeFirstResponder()
       

    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.navigationItem.leftBarButtonItem = self.leftButtonItem
        // searchBarButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = self.rightButtonItem
    
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.resignFirstResponder()
        
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        self.navigationItem.leftBarButtonItem = self.leftButtonItem
        self.navigationItem.rightBarButtonItem = self.rightButtonItem
    }
}

