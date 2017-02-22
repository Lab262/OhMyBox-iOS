//
//  SearchContainerViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchContainerViewController: UIViewController {

    @IBOutlet weak var searchViewContainer: UIView!
    @IBOutlet weak var searchSuggestionsViewContainer: UIView!
    @IBOutlet weak var searchResultsViewContainer: UIView!
    
    @IBOutlet weak var searchBarContainer: UIView!
    
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarContainer.addSubview(searchController.searchBar)
        // Do any additional setup after loading the view.
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
