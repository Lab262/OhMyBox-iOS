//
//  SelectCardViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SelectCardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter = SelectedCardPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        getMoipUsers()
    }
    
    func getMoipUsers() {
        presenter.getUserById()
    }
    
    func registerNib() {
        tableView.registerNibFrom(CardInformationTableViewCell.self)
    }
    
    func generateCreateAccountButtonCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)
        
        return cell
    }
    
    func generateCardInformationCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CardInformationTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    
}

extension SelectCardViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return generateCreateAccountButtonCell(tableView, cellForRowAt: indexPath)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
}

extension SelectCardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
}

