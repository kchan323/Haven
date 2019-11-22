//
//  SearchView.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class SearchView: UIViewController {
    
    var topView: UIView!
    var titleLabel: UILabel!
    
    var searchBar: UISearchBar!
    
    var tableView: UITableView!
    let reuseIdentifier = "searchCellReuse"
    let cellHeight: CGFloat = 70
    var Searches: [Apartment]!
    var filteredSearches: [Apartment]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        topView = UIView()
        topView.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        topView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topView)
        
        titleLabel = UILabel()
        titleLabel.text = "Hello!"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 48)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.bringSubviewToFront(titleLabel)
        
        let search1 = Apartment(image: "onebedroom", title: "1-Bedroom (Spring 2020)", description: "", price: 1085, address: "319 College Ave", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let search2 = Apartment(image: "largesingle", title: "Large Single in Collegetown", description: "", price: 1100, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        Searches = [search1, search2]
        filteredSearches = Searches
        
        searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.placeholder = "Search for apartments."
        searchBar.isTranslucent = false
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)

        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
            
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            titleLabel.widthAnchor.constraint(equalToConstant: 268),
            titleLabel.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            searchBar.heightAnchor.constraint(equalToConstant: 48)
        ])
       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension SearchView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText != "") {
            filteredSearches = searchText.isEmpty ? Searches : Searches.filter( { $0.title.localizedCaseInsensitiveContains(searchText) })
            if (filteredSearches.count == 0) {
                filteredSearches = Searches
            }
        }
        else {
            filteredSearches = Searches
        }
        self.tableView.reloadData()
    }
    
}
    
extension SearchView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredSearches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let search_cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchTableViewCell
        let Search = filteredSearches[indexPath.section]
        search_cell.configure(for: Search)
        search_cell.selectionStyle = .none
        return search_cell
    }
    
}

extension SearchView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
