//
//  HomeViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    var viewSearch: UIView?
    var searchController: UISearchController!
    var boxButtonItem: UIBarButtonItem?
    var clotingArray: [String]?
    var searchButtonItem: UIBarButtonItem?
    @IBOutlet weak var searchBarBoxButton: UIBarButtonItem!
    @IBOutlet weak var searchBarButton: UIBarButtonItem!
    var filtered:[String] = []
    var searchActive : Bool = false
    var data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        
//         let rightboxBarButtonItem = UIBarButtonItem(image: UIImage(named:"box_button"), style: .done, target: self, action: #selector(actionGoCart(_:)))
//        
//        let rightSearchBarButtonItem = UIBarButtonItem(image: UIImage(named:"searchIcon"), style: .done, target: self, action: #selector(searchProducts(_:)))
//             navigationItem.rightBarButtonItems = [rightboxBarButtonItem, rightSearchBarButtonItem]
        searchBar.delegate = self
        self.clotingArray = [String]()
        self.clotingArray?.append("Cloting One")
        self.clotingArray?.append("Cloting Two")
        self.clotingArray?.append("cloting Three")
        self.clotingArray?.append("cloting Four")
        self.clotingArray?.append("cloting Five")
     //   self.navigationItem.setRightBarButtonItems([boxButtonItem!, searchButtonItem!], animated: false)
    }
 
    
    func configureNavigationBar() {
     
        self.navigationBarView.leftBarButton.isHidden = true
        //self.navigationBarView.boxButton.addTarget(self, action: #selector(actionGoCart(_:)), for: .touchUpInside)
        self.navigationBarView.searchButton.addTarget(self, action: #selector(searchProducts(_:)), for: .touchUpInside)
        self.navigationBarView.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureSearchBar()
        self.configureNavigationBar()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func configureTableView () {
        
        self.tableView.estimatedRowHeight = 300
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.layoutIfNeeded()
        
    }

    @IBAction func actionGoCart(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier:"goCart", sender:nil)
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailProduct" {
            
            if let destinationVC = segue.destination as? DetailProductViewController {
                
            }
        }
        
        
        if segue.identifier == "goPromotion" {
            
            if let destinationVC = segue.destination as? RecommendedViewController {
                destinationVC.title = "Promoções"
                destinationVC.titleHeader = "Promoções"
               
            }
        }
        
        if segue.identifier == "goRecommended" {
            
            if let destinationVC = segue.destination as? RecommendedViewController {
                destinationVC.title = "Recomendados"
                destinationVC.titleHeader = "Recomendados"
                
            }
        }
        
    }
    
    
    @IBAction func searchProducts(_ sender: AnyObject) {
      //  self.showSearchBar()
    
    }
    
    func configureSearchBar () {
        //self.searchBarButton.isEnabled = false
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.delegate = self
     // self.searchController.searchBar.setImage(UIImage(named: ""), for: .search, state: UIControlState())
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
       
       
        
        self.viewSearch?.backgroundColor = UIColor.white
        
        self.viewSearch?.addSubview(self.searchController.searchBar)
        
    }
   
    func showSearchBar() {
        
        self.searchController.isActive = true
        self.searchController.searchBar.alpha = 0
       // searchBarButton.isEnabled = false
       // searchBarButton.tintColor = UIColor.clear
       
        let leftNavBarButton = UIBarButtonItem(customView: self.viewSearch!)
        navigationItem.setLeftBarButton(leftNavBarButton, animated: true)
        self.viewSearch?.isHidden = false

      
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
            
            return self.generateClosetCell(tableView, cellForRowAt: indexPath)
        }else if indexPath.section == 1{
            
            
            return self.generateProductCell(tableView, cellForRowAt: indexPath)

        }else if indexPath.section == 2{
           return self.generatePromotionCell(tableView, cellForRowAt: indexPath)
        }else {
            return UITableViewCell()
        }
        
        
        
        
    }
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        cell.delegate = self

        return cell
    }
    
    
    func generatePromotionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PromotionTableViewCell.identifier, for: indexPath) as! PromotionTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    func generateClosetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetTableViewCell.identifier, for: indexPath) as! ClosetTableViewCell
                
        cell.tagType = 5
        cell.clothingtArray = self.clotingArray
        cell.identifierSegue = "goRecommended"
        cell.delegate = self

        return cell
    }
    
    func generateHeaderClosetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
          cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            case 0, 1, 2:
                return 1
            default:
                return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
            if indexPath.row == 0{
                self.performSegue(withIdentifier:"goPromotion", sender:self)

            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            case 0, 1:
                let width = self.view.bounds.size.width * 0.95
                let height = width*1.3
                //1.3
                return height
            case 2:
                
                let width = self.view.bounds.size.width * 0.66
                let height = width*1.6
                
                print ("ALTURA CELL: \(height)")
                
                return height

                //return 396
            case 3:
                return 50
            default:
                return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        switch section {
        case 0:
            
            let header = tableView.dequeueReusableCell(withIdentifier:HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
            
            header.firstTitleLineLabel.text = "Recomendados"
            header.secondTitleLineLabel.text = "Para Você"
            
            return header
        case 1:
            
            let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
            header.firstTitleLineLabel.text = "OLHA AS"
            header.secondTitleLineLabel.text = "NOVIDADES"
            header.iconImage.image = #imageLiteral(resourceName: "iconHeaderType7_image")
            header.widthIconConstraint.constant = 35
            header.heightIconConstraint.constant = 21
            
            return header
            
        default:
            
            let view = UIView()
            view.backgroundColor = UIColor.clear
            
            return view
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 || section == 1 {
            return 70
            //77
        } else {
            return 0.1
        }
    }
  
}
extension HomeViewController: callSegueProtocol {
    
    func callViewController(segueIndentifier:String){
        self.performSegue(withIdentifier:segueIndentifier, sender:self)
    }
}

extension HomeViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    func presentSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.becomeFirstResponder()
       

    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
       
        self.viewSearch?.isHidden = true
      // self.navigationController?.isNavigationBarHidden = false
        //  self.navigationController?.isToolbarHidden = false
       // self.navigationItem.title = "OH-MY-BOX"
      //  self.navigationController?.navigationItem.title = "OH-MY-BOX"
       // self.searchController.searchBar.alpha = 0
//        self.searchController.isActive = false

    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.resignFirstResponder()
        
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        
        //    self.title = "OHMYBOX"
         self.viewSearch?.isHidden = true
    }
}


