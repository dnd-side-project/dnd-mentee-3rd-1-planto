//
//  WhatKindofPlantViewController.swift
//  Planto
//
//  Created by 김호준 on 2020/08/05.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class WhatKindofPlantViewController: UIViewController {
    ///식물의 종류를 선택할 수 있는 ViewController
    
    @IBOutlet weak var plantResults: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    let items: [String] = ["1","2","3"]
    var filteredItems: [String] = []
    
    //검색창이 비어있는지 유무 확인
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.green]
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "품종명"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        plantResults.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = plantResults.indexPathForSelectedRow {
            plantResults.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard
        segue.identifier == "ShowDetailSegue",
        let indexPath = plantResults.indexPathForSelectedRow,
        let detailViewController = segue.destination as? DetailKindViewController
        else {
          return
        }
        
        var plant: String
        if isFiltering {
            plant = filteredItems[indexPath.row]
        } else {
            plant = items[indexPath.row]
        }
        detailViewController.plant = plant
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredItems = items.filter { $0.lowercased().contains(searchText.lowercased()) }
        plantResults.reloadData()
    }
}

extension WhatKindofPlantViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchText: searchBar.text!)
    }
}

extension WhatKindofPlantViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredItems.count
        }
        else {
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if isFiltering {
            cell.textLabel?.text = filteredItems[indexPath.row]
        } else {
            cell.textLabel?.text = items[indexPath.row]
        }
        return cell
    }
}
