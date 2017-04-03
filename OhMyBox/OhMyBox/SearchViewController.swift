//
//  SearchViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let categories = ["ACESSÓRIOS", "BLUSAS", "CALÇAS", "SAPATOS", "BOLSA", "CASA"]
    
    var selectionDelegate: TableViewSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        // Do any additional setup after loading the view.
    }

    func registerNibs() {
        tableView.registerNibFrom(SearchHeaderTableViewCell.self)
        tableView.registerNibFrom(ArrowIndicatorTableViewCell.self)
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

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArrowIndicatorTableViewCell.identifier) as! ArrowIndicatorTableViewCell
        
        cell.title = categories[indexPath.row]
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SearchHeaderTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: SearchHeaderTableViewCell.identifier) as! SearchHeaderTableViewCell
        
        switch section {
        case 0: header.headerTitle = "Categorias"
        default: break
        }

        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionDelegate?.tableViewDelegate(self, didSelectRowWith: categories[indexPath.row])
    }
}
