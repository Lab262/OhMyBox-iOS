//
//  HomeViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var boxButtonItem: UIBarButtonItem?
    
    var filtered:[String] = []
    var allProduct = [Product]()
    
    var highlightsCollectionViewDelegate: BoxesCollectionViewDataSource!
    var newsCollectionViewDelegate: BoxesCollectionViewDataSource!
    var salesCollectionViewDelegate: BoxesCollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibs()
        setUpNavigationBar()
        setUpTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.goToBoxViewController(_:)), name: Notifications.goToBoxViewController, object: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = preferredStatusBarStyle
    }
    
    func setUpNavigationBar() {
     
        navigationController?.navigationBar.isHidden = true
        navigationBarView.leftBarButton.isHidden = true
        navigationBarView.layoutIfNeeded()
    }
    
    func setUpTableView() {
    
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = .white
        tableView.layoutIfNeeded()
    }

    @IBAction func actionGoCart(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier:"goCart", sender:nil)
    
    }
    
    func registerNibs() {
        
        //Header
        tableView.registerNibFrom(HomeTableViewHeaderView.self)
        
        //Cells
        tableView.registerNibFrom(HighlightsTableViewCell.self)
        tableView.registerNibFrom(MiniProductsTableViewCell.self)
        tableView.registerNibFrom(CollectionTableViewCell.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
        }
    }
    
    func goToBoxViewController(_ notification: Notification) {
        navigationBarView.goToCart(startsInBox: false, nil)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            let highlightsCell = generateHighlightsCell(tableView, cellForRowAt: indexPath)
            cell = highlightsCell
        case 1:
            let newsCell = generateNewsCell(tableView, cellForRowAt: indexPath)
            cell = newsCell
        case 2:
            let salesCell = generateSalesCell(tableView, cellForRowAt: indexPath)
            cell = salesCell
        default:
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    func generateSalesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CollectionTableViewCell {
        
        let cell = generateBoxesCell(tableView, cellForRowAt: indexPath)
        
        let dataSource = BoxesCollectionViewDataSource(collectionView: cell.collectionView)
        dataSource.boxes = [1, 2, 3]
        dataSource.collectionSelectionDelegate = self
        salesCollectionViewDelegate = dataSource
        
        cell.collectionViewDataSource = dataSource
        cell.collectionViewDelegate = dataSource
        
        
        
        return cell
    }
    
    func generateHighlightsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CollectionTableViewCell {
        
        let cell = generateBoxesCell(tableView, cellForRowAt: indexPath)
        
        let dataSource = BoxesCollectionViewDataSource(collectionView: cell.collectionView)
        dataSource.boxes = [1, 2, 3]
        dataSource.collectionSelectionDelegate = self
        highlightsCollectionViewDelegate = dataSource
        
        cell.collectionViewDataSource = dataSource
        cell.collectionViewDelegate = dataSource
        
        return cell
    }

    func generateNewsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CollectionTableViewCell {
        
        let cell = generateBoxesCell(tableView, cellForRowAt: indexPath)
        
        let dataSource = BoxesCollectionViewDataSource(collectionView: cell.collectionView)
        dataSource.boxes = [1, 2, 3]
        dataSource.collectionSelectionDelegate = self
        newsCollectionViewDelegate = dataSource
        
        cell.collectionViewDataSource = dataSource
        cell.collectionViewDelegate = dataSource
        
        return cell
    }
    
    func generateBoxesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CollectionTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            case 0, 1, 2:
                return 1
            default:
                return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.section {
        case 0, 1, 2: height = BoxCollectionViewCell.cellSize.height + 4
        default: height = 0
        }
        
        return height
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: HomeTableViewHeaderView?
        
        switch section {
        case 0:
            
            let header = tableView.dequeueReusableCell(withIdentifier:HomeTableViewHeaderView.identifier) as! HomeTableViewHeaderView
            
            header.topLineLabel.text = "BOXES EM ALTA"
            header.bottomLineLabel.text = ""
            
            headerView = header
        case 1:
            
            let header = tableView.dequeueReusableCell(withIdentifier:HomeTableViewHeaderView.identifier) as! HomeTableViewHeaderView
            header.topLineLabel.text = "OLHA AS"
            header.bottomLineLabel.text = "NOVIDADES"
            
            headerView = header
            
        case 2:
            
            let header = tableView.dequeueReusableCell(withIdentifier:HomeTableViewHeaderView.identifier) as! HomeTableViewHeaderView
            header.topLineLabel.text = "PROMOÇÕES, GENTE!"
            header.bottomLineLabel.text = ""
            
            headerView = header
            
        default:
            headerView = nil
        }
        
        headerView?.showAllButton.isHidden = true
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height: CGFloat
        
        switch section {
        case 0, 1, 2:
            height = HomeTableViewHeaderView.cellHeight
        default:
            height = 0
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
  
}

extension HomeViewController: CollectionViewSelectionDelegate {
    
    func collectionViewDelegate(_ colletionViewDelegate: UICollectionViewDelegate, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: SegueIdentifiers.homeToBoxDetail, sender: self)
    }
}

// MARK: Home View MVP

extension HomeViewController: HomeView {
    
}
