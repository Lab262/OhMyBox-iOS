//
//  SearchSuggestionsViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchSuggestionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let suggestions = ["Brinco", "Bota", "Cachecol"]
    
    var selectionDelegate: TableViewSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        // Do any additional setup after loading the view.
    }
    
    func registerNibs() {
        
        tableView.register(UINib(nibName: "SearchSuggestionsHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: SearchSuggestionsHeaderTableViewCell.identifier)
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

extension SearchSuggestionsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionTableViewCell.identifier) as! SearchSuggestionTableViewCell
        cell.suggestionTitle = suggestions[indexPath.row]
        
        return cell
    }
}

extension SearchSuggestionsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 51.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionsHeaderTableViewCell.identifier) as! SearchSuggestionsHeaderTableViewCell
        header.headerTitle = "Buscas Recentes"
        
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionDelegate?.tableViewDelegate(self, tableView, didSelectRowAt: indexPath)
    }
}
