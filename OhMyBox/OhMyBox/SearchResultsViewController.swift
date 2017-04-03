//
//  SearchResultsViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var navigationBar: IconNavigationBar!
    @IBOutlet weak var collectionPickerView: CollectionPickerView!
    @IBOutlet weak var collectionPickerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionPickerViewHeightZeroConstraint: NSLayoutConstraint!
    
    
    var navigationBarTitle: String?
    var products: [Product] = [] {
        didSet {
            productCount = products.count
        }
    }
    var productCount: Int = 0
    var hasCarousel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpNavigationBar()
        setUpFilterButton()
        
        setUpCollectionPickerView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpProductCountLabel()
        if hasCarousel {
            collectionPickerViewHeightConstraint.isActive = true
            collectionPickerView.isHidden = false
        } else {
            collectionPickerViewHeightConstraint.isActive = false
            collectionPickerView.isHidden = true
        }
    }
    
    func setUpCollectionPickerView() {
        collectionPickerView.collectionPickerOptions = ["TUDO", "BRINCOS", "COLARES"]
        collectionPickerView.collectionPickerHandlers = [{}, {}, {}]
    }
    
    func setUpProductCountLabel() {
        let productCountString = "\(productCount) produtos"
        productCountLabel.attributedText = productCountString.with(characterSpacing: 2.17)
    }
    
    func setUpFilterButton() {
        filterButton.setAttributedTitle(filterButton.currentTitle?.with(characterSpacing: 2.04), for: .normal)
        filterButton.setTitle(nil, for: .normal)
    }
    
    func setUpNavigationBar() {
        navigationBar.leftBarButton.setImage(#imageLiteral(resourceName: "searchIcon"), for: .normal)
        navigationBar.titleLabelText = navigationBarTitle
        
    }
    
    func registerNibs() {
        tableView.register(UINib(nibName: "ShowProductTableViewCell", bundle: nil), forCellReuseIdentifier: ShowProductTableViewCell.identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchResultsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowProductTableViewCell.identifier) as! ShowProductTableViewCell
        // align model with cell fields
        //placeholder
        cell.brandName = "Por fashion store"
        cell.productName = "Óculos Cool"
        cell.price = 50.0
        
        return cell
    }
}

extension SearchResultsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ShowProductTableViewCell.cellHeight
    }
}
