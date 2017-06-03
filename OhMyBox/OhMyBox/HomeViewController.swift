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
    
    var highlightsCollectionViewDelegate: BoxesCollectionViewDataSource?
    var newsCollectionViewDelegate: BoxesCollectionViewDataSource?
    var salesCollectionViewDelegate: BoxesCollectionViewDataSource?
    
    var presenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.loadBoxes()
        
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
        navigationBarView.showsLeftBarButton = false
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
        
        if let destination = segue.destination as? BoxDetailViewController {
            
            destination.presenter.box = presenter.selectedBox
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
            cell = generateBoxesCell(tableView, cellForRowAt: indexPath, dataSourceReference: &highlightsCollectionViewDelegate)
        case 1:
            cell = generateBoxesCell(tableView, cellForRowAt: indexPath, dataSourceReference: &newsCollectionViewDelegate)
        case 2:
            cell = generateBoxesCell(tableView, cellForRowAt: indexPath, dataSourceReference: &salesCollectionViewDelegate)
        default:
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    func generateBoxesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, dataSourceReference: inout BoxesCollectionViewDataSource?) -> CollectionTableViewCell {
        
        let cell = generateCollectionTableCell(tableView, cellForRowAt: indexPath)
        
        let dataSource = BoxesCollectionViewDataSource(collectionView: cell.collectionView)
        dataSource.collectionSelectionDelegate = self
        dataSource.boxes = presenter.boxes
        dataSourceReference = dataSource
        
        cell.collectionViewDataSource = dataSource
        cell.collectionViewDelegate = dataSource
        
        dataSource.boxButtonHandler = { indexPath in
            
            CartManager.shared.updateCart(withBox: dataSource.boxes[indexPath.item])
        }
        
        return cell
    }
    
    func generateCollectionTableCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CollectionTableViewCell {
        
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
        
        if let dataSource = colletionViewDelegate as? BoxesCollectionViewDataSource {
            
            presenter.selectedBox = dataSource.boxes[indexPath.item]
        } else {
            
            presenter.selectedBox = nil
        }
        performSegue(withIdentifier: SegueIdentifiers.homeToBoxDetail, sender: self)
    }
}

// MARK: Home View MVP

extension HomeViewController: HomeView {
    
    func reloadData() {
        
        tableView.reloadData()
    }
}
