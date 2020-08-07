//
//  RegisterKindViewController.swift
//  Planto
//
//  Created by 김호준 on 2020/08/08.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class RegisterKindViewController: UIViewController {

    @IBOutlet weak var plantListTableView: UITableView!
    @IBOutlet weak var plantSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


// - MARK: - UITableViewDataSource
extension RegisterKindViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = plantListTableView.dequeueReusableCell(withIdentifier: "plantCell", for: indexPath)
        return cell
    }
}

// - MARK: - UISearchBarDelegate
extension RegisterKindViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
